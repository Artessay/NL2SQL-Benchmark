import logging
import math
from typing import Any, Dict, List, Optional, Sequence

try:
    import json5 as json_parser
except ImportError:  # Strict JSON remains supported in minimal environments.
    import json as json_parser

from model.SQLPromptMix import _CandidateMethodBase


logger = logging.getLogger(__name__)


class CHESSUnitTester(_CandidateMethodBase):
    """The CHESS natural-language Unit Tester component as a model-only method.

    The complete CHESS pipeline also uses retrieval, schema pruning, and its own
    candidate generator. Here, diverse zero-shot candidates are checked against
    candidate-independent natural-language tests and selected conservatively.
    """

    def __init__(self, args, **kwargs):
        self.max_candidate_strategies = max(1, int(kwargs.pop("max_candidate_strategies", 4)))
        self.max_unit_tests = max(1, int(kwargs.pop("max_unit_tests", 7)))
        self.min_judge_confidence = float(kwargs.pop("min_judge_confidence", 0.65))
        self.selection_margin = float(kwargs.pop("selection_margin", 0.15))
        super().__init__(args, **kwargs)

        self.generation_system_prompt = (
            "You are a text-to-SQL expert. Return exactly one read-only SQLite query "
            "and no explanation."
        )
        self.test_writer_system_prompt = (
            "You design candidate-independent natural-language unit tests for text-to-SQL. "
            "Tests must follow only from the question, evidence, and schema."
        )
        self.test_judge_system_prompt = (
            "You are a conservative SQL unit-test judge. Mark failure only for a concrete, "
            "explainable mismatch. Equivalent SQL formulations are acceptable."
        )
        self.candidate_strategies = [
            (
                "Direct baseline",
                "Use straightforward schema grounding and preserve all question literals.",
            ),
            (
                "Decomposed plan",
                "Internally decompose output, joins, predicates, aggregation, ordering, and limit "
                "before emitting only the final SQL.",
            ),
            (
                "Schema and value audit",
                "Focus on entity values, value-bearing columns, join keys, types, NULL behavior, "
                "and evidence alignment.",
            ),
            (
                "Semantic edge-case audit",
                "Focus on DISTINCT, group granularity, HAVING versus WHERE, superlatives, top-k, "
                "ties, and temporal or numeric boundaries.",
            ),
        ]

    def inference(self, schema: str, question: str, evidence: str = None) -> str:
        schema_str = self.format_schema(schema)
        question_str = self.format_question(question, evidence)
        generation_prompts = [
            self._candidate_prompt(schema_str, question_str, name, instruction)
            for name, instruction in self.candidate_strategies[: self.max_candidate_strategies]
        ]
        responses = self._generate_many(
            generation_prompts,
            system_prompt=self.generation_system_prompt,
        )
        candidates = self._unique_sql(self._extract_candidates(responses))
        fallback = candidates[0] if candidates else ";"
        if len(candidates) <= 1:
            return fallback

        unit_tests = self._generate_unit_tests(schema_str, question_str)
        evaluations = [self._safe_evaluate(candidate) for candidate in candidates]
        score_prompts = [
            self._score_prompt(
                schema_str,
                question_str,
                candidate,
                unit_tests,
                evaluations[index],
                index + 1,
            )
            for index, candidate in enumerate(candidates)
        ]
        score_responses = self._generate_many(
            score_prompts,
            system_prompt=self.test_judge_system_prompt,
        )
        ratings = [
            self._parse_candidate_rating(
                response,
                unit_tests,
                evaluations[index],
                expected_candidate_id=index + 1,
            )
            for index, response in enumerate(score_responses)
        ]
        return self._conservative_select(candidates, evaluations, ratings)

    def _generate_unit_tests(self, schema: str, question: str) -> List[Dict[str, str]]:
        prompt = self._unit_test_prompt(schema, question, self.max_unit_tests)
        try:
            response = self._call_model(prompt, self.test_writer_system_prompt)
            tests = self._parse_unit_tests(response)
        except Exception as error:
            logger.warning("Natural-language unit-test generation failed: %s", error)
            tests = []
        if tests:
            return tests[: self.max_unit_tests]
        logger.warning("Using the fixed semantic checklist because generated tests were not parseable.")
        return self._default_unit_tests()[: self.max_unit_tests]

    def _parse_unit_tests(self, response: Any) -> List[Dict[str, str]]:
        if not isinstance(response, str):
            return []
        text = self.fetch_code(response, code_type="json", default=response).strip()
        try:
            payload = json_parser.loads(self.extract_json_object(text))
        except Exception:
            return []

        raw_tests = payload.get("tests", []) if isinstance(payload, dict) else []
        if not isinstance(raw_tests, list):
            return []

        tests = []
        used_test_ids = set()
        used_requirements = set()
        for index, item in enumerate(raw_tests, start=1):
            if isinstance(item, str):
                requirement = item.strip()
                failure_condition = "The candidate contradicts or omits this requirement."
                importance = "required"
                test_id = f"T{index}"
            elif isinstance(item, dict):
                requirement = str(
                    item.get("requirement")
                    or item.get("test")
                    or item.get("assertion")
                    or item.get("description")
                    or ""
                ).strip()
                failure_condition = str(
                    item.get("failure_condition")
                    or item.get("failure")
                    or "The candidate contradicts or omits this requirement."
                ).strip()
                importance = str(item.get("importance", "required")).strip().lower()
                raw_test_id = item.get("id")
                test_id = (
                    str(raw_test_id).strip() if raw_test_id is not None else f"T{index}"
                ) or f"T{index}"
            else:
                continue
            if not requirement or requirement in used_requirements:
                continue
            used_requirements.add(requirement)

            # Judge responses are keyed by test ID.  Make the generated suite
            # unambiguous even when the test writer repeats or omits an ID.
            if test_id in used_test_ids:
                test_id = f"T{index}"
                suffix = 2
                while test_id in used_test_ids:
                    test_id = f"T{index}_{suffix}"
                    suffix += 1
            used_test_ids.add(test_id)
            tests.append(
                {
                    "id": test_id,
                    "requirement": requirement,
                    "failure_condition": failure_condition,
                    "importance": "optional" if importance == "optional" else "required",
                }
            )
        return tests

    @staticmethod
    def _default_unit_tests() -> List[Dict[str, str]]:
        requirements = [
            "The selected expressions answer exactly the requested attributes or measure.",
            "All explicitly stated filters, values, dates, numeric bounds, and evidence are preserved.",
            "Tables and joins connect the requested entities without introducing wrong multiplicity.",
            "Aggregation, grouping, DISTINCT, and HAVING match the requested counting or summary level.",
            "Ordering, extrema, ranking, and LIMIT behavior match any top-k or superlative language.",
            "The query does not add an unsupported restriction or silently change a requested literal.",
        ]
        return [
            {
                "id": f"T{index}",
                "requirement": requirement,
                "failure_condition": "A concrete SQL clause violates or omits this requirement.",
                "importance": "required",
            }
            for index, requirement in enumerate(requirements, start=1)
        ]

    def _parse_candidate_rating(
        self,
        response: Any,
        test_count: Any,
        execution: Optional[Dict[str, Any]],
        expected_candidate_id: Optional[int] = None,
    ) -> Dict[str, Any]:
        # `test_count` historically was an integer; inference now passes the
        # complete test specifications so result IDs and importance can be
        # validated, while direct legacy calls remain supported.
        expected_tests = self._expected_test_importance(test_count)
        test_count = len(expected_tests)
        execution_failed = bool(execution is not None and not execution.get("ok"))
        default = {
            "parsed": False,
            "score": 0.5,
            "passed": 0,
            "failed": 0,
            "optional_failed": 0,
            "unknown": test_count,
            "confidence": 0.0,
            "fatal_error": execution_failed,
            "execution_ok": None if execution is None else bool(execution.get("ok")),
            "passed_test_ids": [],
            "failed_test_ids": [],
        }
        if not isinstance(response, str):
            return default

        text = self.fetch_code(response, code_type="json", default=response).strip()
        try:
            payload = json_parser.loads(self.extract_json_object(text))
            if not isinstance(payload, dict):
                return default
        except Exception:
            return default

        if expected_candidate_id is not None and not self._candidate_id_matches(
            payload.get("candidate_id"), expected_candidate_id
        ):
            return default

        results = payload.get("test_results", payload.get("results", []))
        statuses: Dict[str, Optional[bool]] = {}
        concrete_failures = set()
        if isinstance(results, list):
            for result in results:
                if not isinstance(result, dict):
                    continue
                test_id = str(result.get("test_id", result.get("id", ""))).strip()
                if test_id not in expected_tests or test_id in statuses:
                    # Unknown and duplicate result IDs carry no voting weight.
                    continue
                raw_status = result.get(
                    "passed",
                    result.get("result", result.get("verdict")),
                )
                status = self._test_status(raw_status)
                raw_reason = result.get("reason", "")
                reason = raw_reason.strip() if isinstance(raw_reason, str) else ""
                # An unexplained verdict is not concrete evidence and therefore
                # counts as unknown, never as a reason to switch SQL.
                if status is not None and not reason:
                    status = None
                statuses[test_id] = status
                if status is False:
                    concrete_failures.add(test_id)

        passed = sum(status is True for status in statuses.values())
        required_failed = sum(
            test_id in concrete_failures and expected_tests[test_id] != "optional"
            for test_id, status in statuses.items()
        )
        optional_failed = sum(
            test_id in concrete_failures and expected_tests[test_id] == "optional"
            for test_id, status in statuses.items()
        )
        unknown = test_count - sum(status is not None for status in statuses.values())

        # Optional checks are weak preferences rather than hard failures.
        optional_weight = 0.25
        total_weight = sum(
            optional_weight if importance == "optional" else 1.0
            for importance in expected_tests.values()
        )
        earned_weight = 0.0
        for test_id, importance in expected_tests.items():
            weight = optional_weight if importance == "optional" else 1.0
            status = statuses.get(test_id)
            if status is True:
                earned_weight += weight
            elif status is None:
                earned_weight += 0.5 * weight
        score = earned_weight / total_weight if total_weight else 0.5
        confidence = self._bounded_float(payload.get("confidence"), default=0.5)
        semantic_fatal = self.as_bool(payload.get("fatal_error"), default=False)
        concrete_required_failure = any(
            expected_tests[test_id] != "optional" for test_id in concrete_failures
        )
        fatal_error = execution_failed or bool(
            semantic_fatal
            and confidence >= self.min_judge_confidence
            and concrete_required_failure
        )

        return {
            "parsed": any(status is not None for status in statuses.values()),
            "score": score,
            "passed": passed,
            "failed": required_failed,
            "optional_failed": optional_failed,
            "unknown": unknown,
            "confidence": confidence,
            "fatal_error": fatal_error,
            "execution_ok": None if execution is None else bool(execution.get("ok")),
            "passed_test_ids": [
                test_id for test_id in expected_tests if statuses.get(test_id) is True
            ],
            "failed_test_ids": [
                test_id
                for test_id in expected_tests
                if test_id in concrete_failures and expected_tests[test_id] != "optional"
            ],
        }

    @staticmethod
    def _candidate_id_matches(value: Any, expected: int) -> bool:
        if isinstance(value, bool):
            return False
        if isinstance(value, int):
            return value == expected
        if isinstance(value, float):
            return math.isfinite(value) and value.is_integer() and int(value) == expected
        if isinstance(value, str) and value.strip().isdigit():
            return int(value.strip()) == expected
        return False

    @staticmethod
    def _expected_test_importance(
        unit_tests: Any,
    ) -> Dict[str, str]:
        # Retain compatibility with direct helper calls that supplied only a
        # count before ratings became ID-aware.
        if isinstance(unit_tests, int):
            return {f"T{index}": "required" for index in range(1, max(0, unit_tests) + 1)}

        expected = {}
        for index, unit_test in enumerate(unit_tests, start=1):
            if not isinstance(unit_test, dict):
                continue
            raw_test_id = unit_test.get("id")
            test_id = (
                str(raw_test_id).strip() if raw_test_id is not None else f"T{index}"
            )
            if not test_id or test_id in expected:
                continue
            importance = str(unit_test.get("importance", "required")).strip().lower()
            expected[test_id] = "optional" if importance == "optional" else "required"
        return expected

    @staticmethod
    def _add_legacy_test_statuses(
        statuses: Dict[str, Optional[bool]],
        items: Any,
        status: bool,
        expected_tests: Dict[str, str],
    ) -> None:
        if not isinstance(items, list):
            return
        for item in items:
            if isinstance(item, dict):
                test_id = str(item.get("test_id", item.get("id", ""))).strip()
            else:
                test_id = str(item).strip()
            if test_id in expected_tests and test_id not in statuses:
                statuses[test_id] = status

    def _conservative_select(
        self,
        candidates: Sequence[str],
        executions: Sequence[Optional[Dict[str, Any]]],
        ratings: Sequence[Dict[str, Any]],
    ) -> str:
        fallback = candidates[0] if candidates else ";"
        if not candidates or len(ratings) != len(candidates):
            return fallback

        # A concrete execution failure is sufficient to move to the best stable,
        # executable alternative. Successful zero-row execution remains eligible.
        base_execution = executions[0] if executions else None
        if base_execution is not None and not base_execution.get("ok"):
            executable = [
                index
                for index, execution in enumerate(executions)
                if execution is not None and execution.get("ok")
            ]
            if executable:
                judged_safe = [
                    index
                    for index in executable
                    if ratings[index].get("parsed") and not ratings[index].get("fatal_error")
                ]
                selection_pool = judged_safe or executable
                selection_pool.sort(
                    key=lambda index: self._rating_key(ratings[index], index),
                    reverse=True,
                )
                return candidates[selection_pool[0]]
            return fallback

        eligible = [
            index
            for index, rating in enumerate(ratings)
            if rating.get("parsed")
            and rating.get("execution_ok") is not False
            and not rating.get("fatal_error")
        ]
        if not eligible or not ratings[0].get("parsed"):
            return fallback

        base = ratings[0]
        base_has_failure = bool(base.get("fatal_error") or base.get("failed", 0) > 0)
        base_failure_is_reliable = bool(
            base.get("execution_ok") is False
            or (base_has_failure and base.get("confidence", 0.0) >= self.min_judge_confidence)
        )
        if not base_failure_is_reliable:
            return fallback

        # Unknown judgements are not evidence that an alternative fixes a
        # concrete base failure. Require an explicit pass for every failed,
        # required test before switching on semantic grounds.
        base_failed_ids = set(base.get("failed_test_ids", []))
        if not base_failed_ids:
            return fallback

        eligible_alternatives = [
            index
            for index in eligible
            if index != 0
            and base_failed_ids.issubset(
                set(ratings[index].get("passed_test_ids", []))
            )
        ]
        if not eligible_alternatives:
            return fallback
        winner = max(
            eligible_alternatives,
            key=lambda index: self._rating_key(ratings[index], index),
        )
        selected = ratings[winner]
        if selected.get("confidence", 0.0) < self.min_judge_confidence:
            return fallback

        fewer_failures = selected.get("failed", 0) < base.get("failed", 0)
        clear_score_gain = selected.get("score", 0.0) >= base.get("score", 0.0) + self.selection_margin
        does_not_add_failures = selected.get("failed", 0) <= base.get("failed", 0)
        does_not_lose_score = selected.get("score", 0.0) >= base.get("score", 0.0)
        if (fewer_failures and does_not_lose_score) or (
            clear_score_gain and does_not_add_failures
        ):
            return candidates[winner]
        return fallback

    @staticmethod
    def _rating_key(rating: Dict[str, Any], index: int) -> tuple:
        return (
            float(rating.get("score", 0.0)),
            -int(rating.get("failed", 0)),
            int(rating.get("passed", 0)),
            float(rating.get("confidence", 0.0)),
            -index,
        )

    @staticmethod
    def _test_status(value: Any) -> Optional[bool]:
        if isinstance(value, bool):
            return value
        if isinstance(value, str):
            normalized = value.strip().lower()
            if normalized in {"pass", "passed", "true", "yes", "correct"}:
                return True
            if normalized in {"fail", "failed", "false", "no", "incorrect"}:
                return False
        return None

    @staticmethod
    def _bounded_float(value: Any, default: float) -> float:
        try:
            number = float(value)
        except (TypeError, ValueError):
            return default
        if not math.isfinite(number):
            return default
        return max(0.0, min(1.0, number))

    @staticmethod
    def _candidate_prompt(
        schema: str,
        question: str,
        strategy_name: str,
        instruction: str,
    ) -> str:
        return f"""Database schema:
```
{schema}
```

Question (including any evidence):
{question}

Candidate strategy: {strategy_name}
{instruction}

Return exactly one SQLite-compatible, read-only SELECT/WITH query. Output SQL only.
"""

    @staticmethod
    def _unit_test_prompt(schema: str, question: str, max_tests: int) -> str:
        return f"""Create natural-language unit tests for judging candidate SQL queries.

Database schema:
```
{schema}
```

Question (including any evidence):
{question}

Write at most {max_tests} concise, non-overlapping tests. Cover only requirements supported by
the question/evidence and schema: requested output, joins, filters and literals, aggregation and
grouping, DISTINCT, ordering, extrema, and limit when relevant. Do not assume a particular SQL
formulation, do not inspect any candidate, and do not infer requirements that were not stated.

Return only JSON:
{{
  "tests": [
    {{
      "id": "T1",
      "requirement": "natural-language property the answer must satisfy",
      "failure_condition": "concrete condition under which candidate SQL fails this test",
      "importance": "required"
    }}
  ]
}}
"""

    @staticmethod
    def _score_prompt(
        schema: str,
        question: str,
        candidate: str,
        unit_tests: Sequence[Dict[str, str]],
        execution: Optional[Dict[str, Any]],
        candidate_id: int,
    ) -> str:
        test_text = "\n".join(
            f"- {test['id']} [{test['importance']}]: {test['requirement']} "
            f"Failure condition: {test['failure_condition']}"
            for test in unit_tests
        )
        if execution is None:
            execution_text = "not available"
        elif execution.get("ok"):
            row_count = len(execution.get("data") or [])
            execution_text = (
                f"succeeded and returned {row_count} row(s). Zero rows is a valid execution and "
                "must not by itself fail any semantic test."
            )
        else:
            execution_text = "failed: " + str(execution.get("error", "unknown error"))[:300]

        return f"""Evaluate Candidate {candidate_id} against every unit test independently.

Database schema:
```
{schema}
```

Question (including any evidence):
{question}

Candidate SQL:
```sql
{candidate}
```

Read-only execution status: {execution_text}

Unit tests:
{test_text}

Use `passed: null` when the SQL alone does not establish pass or failure. Mark `fatal_error` true
only for a concrete syntax/schema/execution defect or a decisive semantic contradiction. Equivalent
SQL formulations are valid. Never penalize a successful zero-row result merely for being empty.

Return only JSON:
{{
  "candidate_id": {candidate_id},
  "test_results": [
    {{"test_id": "T1", "passed": true, "reason": "short clause-level reason"}}
  ],
  "score": 0.0,
  "confidence": 0.0,
  "fatal_error": false
}}
`score` and `confidence` must be numbers from 0 to 1.
"""


if __name__ == "__main__":
    import utils

    CHESSUnitTester(utils.get_args())
