import json
import logging
from typing import Any, Dict, List

from model.Agent import Agent
from model.DACCorrection import _ReadOnlyCorrectionMixin


logger = logging.getLogger(__name__)


class _SelectOnlyVerifierMixin(_ReadOnlyCorrectionMixin):
    """Read-only candidate handling specialized for final NL2SQL answers."""

    def _finalize_sql(self, sql: str) -> str:
        sql = self._normalize_sql_response(sql)
        if self.is_read_only_sql(sql):
            return sql
        logger.warning("Blocked unsafe or non-query verifier output.")
        return ";"


class CoTVerifier(_SelectOnlyVerifierMixin, Agent):
    """Structured chain-of-thought verifier followed by conservative repair.

    The verifier exposes only a compact, auditable alignment table rather than
    relying on an unstructured correctness judgement.  A repair is attempted
    only when that table contains a concrete failed check with high confidence.
    """

    def __init__(self, args, **kwargs):
        kwargs.setdefault("min_refine_confidence", 0.80)
        super().__init__(args, **kwargs)

        self.check_prompt = (
            "You are a conservative text-to-SQL semantic verifier. Decompose the "
            "user's requested intent and the predicted SQL into explicit parts, "
            "then align them requirement by requirement. Treat equivalent SQL "
            "formulations as correct and report an error only when it is concrete."
        )
        self.refine_prompt = (
            "You correct text-to-SQL predictions from a structured semantic "
            "alignment report. Make the smallest change that fixes the cited "
            "failed alignment and preserve every unaffected literal and clause."
        )

    def __call__(self, schema: str, question: str, evidence: str = None) -> str:
        """Do not inherit Base.__call__'s silent fallback to a fresh generation."""
        try:
            return self._finalize_sql(self.inference(schema, question, evidence))
        except KeyboardInterrupt:
            raise
        except Exception:
            logger.exception("CoTVerifier failed before an initial SQL was available.")
            return ";"

    def inference(self, schema: str, question: str, evidence: str = None) -> str:
        initial_response = self.model.generate(self.get_prompt(schema, question, evidence))
        initial_sql = self.fetch_code(initial_response, code_type="sql", default=";").strip() or ";"

        # Once an initial prediction exists, every verifier-side failure is
        # conservative: never replace it via Base.inference's hidden fallback.
        try:
            result = self.verify_and_refine(schema, question, evidence, initial_sql)
            return self._finalize_sql(result)
        except KeyboardInterrupt:
            raise
        except Exception:
            logger.exception("CoT verification failed; keeping the initial SQL.")
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
        response = self.model.generate(
            self.get_cot_verification_prompt(schema_str, question_str, initial_sql),
            system_prompt=self.check_prompt,
        )
        status_text = self.fetch_code(response, code_type="json", default=response)
        status = self.parse_check_status(status_text)
        logger.info("CoT verifier status: %s", status)

        if status.get("is_correct", True):
            return self._finalize_sql(initial_sql)
        if not self._has_actionable_alignment_failure(status):
            logger.info("CoT verifier found no high-confidence, structured mismatch.")
            return self._finalize_sql(initial_sql)

        reason = self._format_refinement_reason(status)
        candidate_sql = self.refine_sql_query(schema_str, question_str, initial_sql, reason)
        selected_sql = self._select_safe_correction(
            initial_sql,
            candidate_sql,
            schema_str,
            question_str,
            status,
        )
        return self._finalize_sql(selected_sql)

    def _has_actionable_alignment_failure(self, status: Dict[str, Any]) -> bool:
        if status.get("is_correct", True):
            return False
        if not status.get("needs_refinement", False):
            return False
        if status.get("confidence", 0.0) < self.min_refine_confidence:
            return False

        intent = status.get("question_intent")
        clauses = status.get("sql_clauses")
        checks = status.get("alignment_checks")
        if not isinstance(intent, (dict, list)) or not intent:
            return False
        if not isinstance(clauses, (dict, list)) or not clauses:
            return False
        if not isinstance(checks, list) or not checks:
            return False

        return any(self._is_concrete_failed_check(check) for check in checks)

    @staticmethod
    def _is_concrete_failed_check(check: Any) -> bool:
        if not isinstance(check, dict):
            return False
        verdict = str(check.get("verdict", "")).strip().lower()
        if verdict not in {"fail", "failed", "incorrect", "mismatch"}:
            return False
        requirement = check.get("requirement", "")
        implementation = check.get("sql_implementation", "")
        explanation = check.get("explanation", check.get("evidence", ""))
        if not all(isinstance(value, str) and value.strip() for value in (
            requirement, implementation, explanation
        )):
            return False
        uncertainty = ("not sure", "uncertain", "possibly", "maybe", "might be")
        return not any(marker in explanation.lower() for marker in uncertainty)

    @staticmethod
    def _format_refinement_reason(status: Dict[str, Any]) -> str:
        failed_checks: List[Dict[str, Any]] = [
            check
            for check in status.get("alignment_checks", [])
            if CoTVerifier._is_concrete_failed_check(check)
        ]
        report = {
            "summary": status.get("reason", ""),
            "concrete_errors": status.get("errors", []),
            "failed_alignment_checks": failed_checks,
        }
        return json.dumps(report, ensure_ascii=False)

    @staticmethod
    def get_cot_verification_prompt(schema: str, question: str, sql: str) -> str:
        return f"""Database schema:
```
{schema}
```

Question (including any supplied evidence):
```
{question}
```

Predicted SQL:
```sql
{sql}
```

Perform a structured semantic verification in this exact order:
1. Extract `question_intent` item by item: requested output, entities, filters and
   literals, joins/relationships, aggregation, grouping, having conditions,
   ordering/ranking, limits, comparisons, and temporal requirements. Use
   `not_requested` for categories that are absent.
2. Extract `sql_clauses` item by item: SELECT, FROM/JOIN, WHERE, GROUP BY,
   HAVING, ORDER BY, LIMIT, set operations, and subqueries. Use `absent` where
   applicable; do not silently infer clauses that are not present.
3. Build `alignment_checks`. Every requested intent item must have one check
   containing `requirement`, `sql_implementation`, `verdict` (`pass`, `fail`, or
   `uncertain`), and `explanation` grounded in the shown question/schema/SQL.
4. Decide correctness only from those alignments. Equivalent formulations are
   valid. A non-optimal style, aliases, subqueries, or a potentially empty result
   is not by itself a semantic error. Never invent a replacement literal.

Return one JSON object and no prose:
```json
{{
  "question_intent": {{
    "requested_output": [], "entities": [], "filters_and_literals": [],
    "joins": [], "aggregation": "not_requested", "grouping": "not_requested",
    "having": "not_requested", "ordering_or_ranking": "not_requested",
    "limit": "not_requested", "comparison_or_temporal": "not_requested"
  }},
  "sql_clauses": {{
    "select": "", "from_and_joins": "", "where": "absent",
    "group_by": "absent", "having": "absent", "order_by": "absent",
    "limit": "absent", "set_operations": "absent", "subqueries": "absent"
  }},
  "alignment_checks": [
    {{
      "requirement": "one explicit question requirement",
      "sql_implementation": "the exact implementing clause, or 'missing'",
      "verdict": "pass|fail|uncertain",
      "explanation": "concrete evidence"
    }}
  ],
  "reason": "short overall conclusion",
  "is_correct": true,
  "confidence": 0.0,
  "needs_refinement": false,
  "errors": []
}}
```

Conservative decision rule: if a possible mismatch cannot be established from
the supplied information, use `uncertain`, keep `is_correct` true, set
`needs_refinement` false, and use confidence <= 0.5.
"""
