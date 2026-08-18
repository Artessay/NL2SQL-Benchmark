import json
import logging
import math
from typing import Any, Dict, List

from model.Agent import Agent, json_parser
from model.CoTVerifier import _SelectOnlyVerifierMixin


logger = logging.getLogger(__name__)


class CoVe(_SelectOnlyVerifierMixin, Agent):
    """Chain-of-Verification semantic checker with conservative correction.

    Verification questions are planned from the draft but answered without
    exposing that draft. A final aggregation compares the independently derived
    requirements with the SQL and may repair only legally cited mismatches.
    """

    def __init__(self, args, **kwargs):
        self.max_verification_questions = kwargs.pop("max_verification_questions", 3)
        kwargs.setdefault("min_refine_confidence", 0.80)
        super().__init__(args, **kwargs)

        self.plan_prompt = (
            "You plan independent, atomic checks for text-to-SQL semantic "
            "verification. Do not answer the checks and do not put an expected "
            "answer into a verification question."
        )
        self.independent_check_prompt = (
            "You answer exactly one semantic verification question independently. "
            "Work only from the schema, user question, and evidence. You will not "
            "see the draft SQL; do not guess or assume facts not shown."
        )
        self.aggregate_prompt = (
            "You conservatively compare independently derived expected semantics "
            "with a draft SQL. Only a concrete, legally cited mismatch may justify "
            "correction."
        )
        self.refine_prompt = (
            "You correct a text-to-SQL prediction using independently verified "
            "semantic failures. Make the smallest possible correction and preserve "
            "all unaffected literals, filters, joins, and requested outputs."
        )

    def __call__(self, schema: str, question: str, evidence: str = None) -> str:
        """Avoid Base.__call__ silently replacing a failed CoVe pipeline."""
        try:
            return self._finalize_sql(self.inference(schema, question, evidence))
        except KeyboardInterrupt:
            raise
        except Exception:
            logger.exception("CoVe failed before an initial SQL was available.")
            return ";"

    def inference(self, schema: str, question: str, evidence: str = None) -> str:
        initial_response = self.model.generate(self.get_prompt(schema, question, evidence))
        initial_sql = self.fetch_code(initial_response, code_type="sql", default=";").strip() or ";"

        try:
            result = self.verify_and_refine(schema, question, evidence, initial_sql)
            return self._finalize_sql(result)
        except KeyboardInterrupt:
            raise
        except Exception:
            logger.exception("CoVe verification failed; keeping the initial SQL.")
            return self._finalize_sql(initial_sql)

    def verify_and_refine(
        self,
        schema: str,
        question: str,
        evidence: str,
        initial_sql: str,
    ) -> str:
        schema_str = self.format_schema(schema)
        question_str = self.format_question(question, evidence)

        questions = self.plan_verification_questions(schema_str, question_str, initial_sql)
        if not questions:
            logger.info("CoVe produced no usable verification plan; keeping initial SQL.")
            return self._finalize_sql(initial_sql)

        answers = self.answer_verification_questions(
            schema_str,
            question_str,
            questions,
        )
        verified_answers = [
            answer for answer in answers if self._is_usable_independent_answer(answer)
        ]
        if not verified_answers:
            logger.info("CoVe produced no independently grounded answers.")
            return self._finalize_sql(initial_sql)

        status = self.aggregate_verification(
            schema_str,
            question_str,
            initial_sql,
            verified_answers,
        )
        if not self._aggregation_is_actionable(status, verified_answers):
            logger.info("CoVe aggregation did not confirm an actionable error.")
            return self._finalize_sql(initial_sql)

        reason = self._format_refinement_reason(status, verified_answers)
        candidate_sql = self.refine_sql_query(schema_str, question_str, initial_sql, reason)
        selected_sql = self._select_safe_correction(
            initial_sql,
            candidate_sql,
            schema_str,
            question_str,
            status,
        )
        return self._finalize_sql(selected_sql)

    def plan_verification_questions(
        self,
        schema: str,
        question: str,
        sql: str,
    ) -> List[Dict[str, str]]:
        response = self.model.generate(
            self.get_plan_prompt(schema, question, sql),
            system_prompt=self.plan_prompt,
        )
        try:
            payload = self._parse_json_object(response)
            raw_questions = payload.get("questions", [])
            if not isinstance(raw_questions, list):
                return []

            questions: List[Dict[str, str]] = []
            seen = set()
            for item in raw_questions:
                if isinstance(item, str):
                    text = item.strip()
                    focus = "semantic_alignment"
                elif isinstance(item, dict):
                    text = str(item.get("question", "")).strip()
                    focus = str(item.get("focus", "semantic_alignment")).strip()
                else:
                    continue
                normalized = " ".join(text.lower().split())
                if not text or normalized in seen:
                    continue
                seen.add(normalized)
                questions.append({
                    # Model-provided IDs are deliberately ignored: stable unique
                    # IDs make later evidence citations unambiguous.
                    "id": f"v{len(questions) + 1}",
                    "focus": focus or "semantic_alignment",
                    "question": text,
                })
                if len(questions) >= self.max_verification_questions:
                    break
            return questions
        except Exception as exc:
            logger.warning("Failed to parse CoVe verification plan: %s", exc)
            return []

    def answer_verification_questions(
        self,
        schema: str,
        question: str,
        questions: List[Dict[str, str]],
    ) -> List[Dict[str, Any]]:
        prompts = [
            self.get_independent_answer_prompt(schema, question, item)
            for item in questions
        ]

        try:
            responses = self.model.generate(
                prompts, system_prompt=self.independent_check_prompt
            )
            if not isinstance(responses, (list, tuple)):
                raise TypeError("batch generation did not return a response list")
            if len(responses) != len(prompts):
                raise ValueError("batch generation returned the wrong response count")
            responses = list(responses)
        except KeyboardInterrupt:
            raise
        except Exception as exc:
            logger.warning(
                "CoVe batch verification failed; falling back to sequential calls: %s",
                exc,
            )
            responses = []
            for prompt in prompts:
                try:
                    responses.append(
                        self.model.generate(
                            prompt, system_prompt=self.independent_check_prompt
                        )
                    )
                except KeyboardInterrupt:
                    raise
                except Exception as sequential_exc:
                    logger.warning(
                        "One independent CoVe answer failed: %s", sequential_exc
                    )
                    responses.append(None)

        answers: List[Dict[str, Any]] = []
        for verification_question, response in zip(questions, responses):
            if not isinstance(response, str):
                continue
            try:
                payload = self._parse_json_object(response)
                confidence = float(payload.get("confidence", 0.0))
                confidence = (
                    max(0.0, min(1.0, confidence))
                    if math.isfinite(confidence)
                    else 0.0
                )
                answer = payload.get("answer", "")
                grounding = payload.get("grounding", payload.get("evidence", ""))
                answers.append({
                    "id": verification_question["id"],
                    "focus": verification_question["focus"],
                    "verification_question": verification_question["question"],
                    "is_answerable": self.as_bool(
                        payload.get("is_answerable"), default=False
                    ),
                    "answer": answer,
                    "grounding": grounding,
                    "confidence": confidence,
                })
            except Exception as exc:
                logger.warning(
                    "Failed to parse independent CoVe answer %s: %s",
                    verification_question["id"],
                    exc,
                )
        return answers

    def aggregate_verification(
        self,
        schema: str,
        question: str,
        sql: str,
        answers: List[Dict[str, Any]],
    ) -> Dict[str, Any]:
        response = self.model.generate(
            self.get_aggregation_prompt(schema, question, sql, answers),
            system_prompt=self.aggregate_prompt,
        )
        status_text = self.fetch_code(response, code_type="json", default=response)
        status = self.parse_check_status(status_text)

        failed_ids = status.get("failed_question_ids", [])
        if isinstance(failed_ids, str):
            failed_ids = [failed_ids]
        elif not isinstance(failed_ids, list):
            failed_ids = []
        status["failed_question_ids"] = [str(item) for item in failed_ids]
        status["independently_verified_ids"] = [
            str(answer.get("id", "")) for answer in answers
        ]
        logger.info("CoVe aggregate status: %s", status)
        return status

    def _is_usable_independent_answer(self, answer: Dict[str, Any]) -> bool:
        expected = answer.get("answer", "")
        grounding = answer.get("grounding", "")
        return (
            answer.get("is_answerable", False)
            and answer.get("confidence", 0.0) >= self.min_refine_confidence
            and self._has_content(expected)
            and self._has_content(grounding)
        )

    @staticmethod
    def _has_content(value: Any) -> bool:
        if isinstance(value, str):
            return bool(value.strip())
        if isinstance(value, (dict, list, tuple)):
            return bool(value)
        return value is not None

    def _aggregation_is_actionable(
        self,
        status: Dict[str, Any],
        verified_answers: List[Dict[str, Any]],
    ) -> bool:
        if not self._is_actionable(status):
            return False

        independently_verified_ids = {
            str(answer.get("id", "")) for answer in verified_answers
        }
        cited_ids = {str(item) for item in status.get("failed_question_ids", [])}
        if not cited_ids or not cited_ids.issubset(independently_verified_ids):
            return False

        raw_errors = status.get("errors", [])
        validated_errors = [
            error
            for error in raw_errors
            if isinstance(error, dict)
            and error.get("verification_question_id") in cited_ids
            and self._is_concrete_error(error)
        ]
        error_ids = {
            error["verification_question_id"] for error in validated_errors
        }
        # Every error must be bound to an independent answer, and every cited
        # failed answer must have a concrete typed error.
        if len(validated_errors) != len(raw_errors) or not cited_ids.issubset(error_ids):
            return False
        status["validated_errors"] = validated_errors
        return True

    @staticmethod
    def _format_refinement_reason(
        status: Dict[str, Any],
        verified_answers: List[Dict[str, Any]],
    ) -> str:
        cited_ids = {str(item) for item in status.get("failed_question_ids", [])}
        validated_errors = status.get("validated_errors", [])
        report = {
            # Do not forward the free-form aggregate reason: unlike the items
            # below, arbitrary clauses in it cannot be bound to an independent
            # verification answer.
            "error_summary": [error.get("description", "") for error in validated_errors],
            "errors": validated_errors,
            "cited_independent_verifications": [
                {
                    "id": answer.get("id", ""),
                    "verification_question": answer.get("verification_question", ""),
                    "expected_answer": answer.get("answer", ""),
                    "grounding": answer.get("grounding", ""),
                    "confidence": answer.get("confidence", 0.0),
                }
                for answer in verified_answers
                if str(answer.get("id", "")) in cited_ids
            ],
        }
        return json.dumps(report, ensure_ascii=False)

    @staticmethod
    def _parse_json_object(response: str) -> Dict[str, Any]:
        text = Agent.fetch_code(response, code_type="json", default=response)
        payload = json_parser.loads(Agent.extract_json_object(text))
        if not isinstance(payload, dict):
            raise ValueError("CoVe response is not a JSON object")
        return payload

    @staticmethod
    def get_plan_prompt(schema: str, question: str, sql: str) -> str:
        return f"""Database schema:
```
{schema}
```

User question (including any supplied evidence):
```
{question}
```

Predicted SQL:
```sql
{sql}
```

Plan at most 3 independent, atomic verification questions whose answers establish
the expected semantics before comparison with the draft. Cover the most relevant
of: requested output, schema relationships, filters and exact literals,
aggregation/grouping, and ordering/limit. Omit irrelevant categories.

Each verification question must:
- be answerable from only the schema, user question, and evidence;
- ask what the correct requirement or grounded schema fact is, not whether the
  predicted SQL passes;
- neither quote nor reveal a choice made by the predicted SQL;
- contain no expected answer and no hint from another check.

The predicted SQL is visible only so the plan covers potentially consequential
claims. The later answerer will not receive it.

Return JSON only:
```json
{{
  "questions": [
    {{
      "focus": "requested_output|schema|join|filter|aggregation|ordering|other",
      "question": "What exact output and aggregation does the question request?"
    }}
  ]
}}
```
"""

    @staticmethod
    def get_independent_answer_prompt(
        schema: str,
        question: str,
        verification_question: Dict[str, str],
    ) -> str:
        return f"""Database schema:
```
{schema}
```

User question (including any supplied evidence):
```
{question}
```

Independent verification question ({verification_question['id']}):
```
{verification_question['question']}
```

Answer only this question without access to any draft SQL or previous answer.
State the expected semantic requirement or schema fact, grounded explicitly in
the shown question/evidence/schema. `confidence` is confidence in this independent
answer. If it cannot be established, set `is_answerable` false and confidence <=
0.5. Do not judge or propose SQL. Return one JSON object and no prose:
```json
{{
  "is_answerable": true,
  "answer": "the independently derived requirement or fact",
  "grounding": "specific question/evidence/schema support",
  "confidence": 0.0
}}
```
"""

    @staticmethod
    def get_aggregation_prompt(
        schema: str,
        question: str,
        sql: str,
        answers: List[Dict[str, Any]],
    ) -> str:
        compact_answers = [
            {
                "id": answer.get("id", ""),
                "focus": answer.get("focus", ""),
                "verification_question": answer.get("verification_question", ""),
                "answer": answer.get("answer", ""),
                "grounding": answer.get("grounding", ""),
                "confidence": answer.get("confidence", 0.0),
            }
            for answer in answers
        ]
        answer_json = json.dumps(compact_answers, ensure_ascii=False, indent=2)
        return f"""Database schema:
```
{schema}
```

User question (including any supplied evidence):
```
{question}
```

Predicted SQL:
```sql
{sql}
```

Independent expected-semantics results (produced without seeing the SQL):
```json
{answer_json}
```

Compare the predicted SQL with only these independent results. Mark it incorrect
only when a high-confidence result establishes a concrete mismatch. Do not invent
requirements, add uncited errors, or turn equivalent formulations and stylistic
differences into errors. Every `failed_question_ids` entry must be an ID shown
above and must directly ground the reported mismatch. Return JSON only:
```json
{{
  "reason": "short aggregate conclusion",
  "is_correct": true,
  "confidence": 0.0,
  "needs_refinement": false,
  "errors": [
    {{
      "verification_question_id": "v1",
      "type": "wrong_filter|wrong_join|wrong_select|wrong_aggregation|other",
      "description": "concrete mismatch grounded by that verification answer"
    }}
  ],
  "failed_question_ids": []
}}
```
"""
