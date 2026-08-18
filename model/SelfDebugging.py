"""Explanation-and-execution self-debugging baseline for text-to-SQL."""

import json
import logging
from typing import Any, Dict

from model.Agent import Agent
from model.DACCorrection import _ReadOnlyCorrectionMixin


logger = logging.getLogger(__name__)


class SelfDebugging(_ReadOnlyCorrectionMixin, Agent):
    """Explain SQL clauses, inspect safe execution feedback, then self-correct."""

    def __init__(self, args, **kwargs):
        self.max_feedback_rows = kwargs.pop("max_feedback_rows", 10)
        self.max_feedback_cell_chars = kwargs.pop("max_feedback_cell_chars", 200)
        kwargs.setdefault("min_refine_confidence", 0.80)
        super().__init__(args, **kwargs)
        self.explain_system_prompt = (
            "Explain what each SQL clause does. Do not revise the SQL in this step. "
            "Return concise JSON only."
        )
        self.debug_system_prompt = (
            "Conservatively self-debug a text-to-SQL prediction using its explanation "
            "and bounded read-only execution feedback. Return JSON only."
        )

    def check_and_refine_sql(
        self, schema: str, question: str, evidence: str, sql: str
    ) -> str:
        original_sql = sql
        schema_str = self.format_schema(schema)
        question_str = self.format_question(question, evidence)
        try:
            explanation = self._explain_clauses(schema_str, question_str, original_sql)
        except Exception as exc:
            logger.warning("Clause explanation failed; retain original SQL: %s", exc)
            return original_sql

        execution_feedback = self._safe_execution_feedback(original_sql)
        try:
            response = self.model.generate(
                self._get_debug_prompt(
                    schema_str,
                    question_str,
                    original_sql,
                    explanation,
                    execution_feedback,
                ),
                system_prompt=self.debug_system_prompt,
            )
            payload = self._parse_json_response(response)
            status = self.normalize_check_status(payload)
        except Exception as exc:
            logger.warning("Self-debugging verdict failed; retain original SQL: %s", exc)
            return original_sql

        logger.info("Self-debugging status: %s", status)
        if not self._is_actionable(status):
            return original_sql
        candidate_sql = self._corrected_sql(payload)
        return self._select_safe_correction(
            original_sql, candidate_sql, schema_str, question_str, status
        )

    def _explain_clauses(self, schema: str, question: str, sql: str) -> Dict[str, Any]:
        prompt = f"""Database schema:
{schema}

Question and evidence:
{question}

Predicted SQL:
```sql
{sql}
```

Explain the operational meaning of every present clause without correcting it.
Return JSON only:
{{
  "select": "what is projected",
  "from_joins": "row sources and join behavior",
  "where": "row filters and literal meanings",
  "group_having": "grouping and aggregate filters",
  "order_limit": "ordering and cardinality restriction",
  "nested_or_set": "subquery or set-operation behavior",
  "predicted_result": "shape and meaning of the result"
}}"""
        response = self.model.generate(prompt, system_prompt=self.explain_system_prompt)
        return self._parse_json_response(response)

    def _safe_execution_feedback(self, sql: str) -> Dict[str, Any]:
        executor = getattr(self, "sql_executor", None)
        if executor is None:
            return {"status": "unavailable", "message": "No SQL executor is attached."}
        if not self.is_read_only_sql(sql):
            return {
                "status": "blocked",
                "message": "Execution skipped: SQL is not one read-only SELECT/WITH statement.",
            }
        try:
            result = executor.execute_sql(sql)
        except Exception as exc:
            return {"status": "error", "error": self._bounded_text(exc)}
        if "data" not in result:
            return {
                "status": "error",
                "error": self._bounded_text(result.get("sqlite_error", "query execution failed")),
            }

        rows = result.get("data") or []
        preview = []
        for row in rows[:self.max_feedback_rows]:
            values = row if isinstance(row, (list, tuple)) else (row,)
            preview.append([self._bounded_value(value) for value in values])
        return {
            "status": "success",
            "row_count": len(rows),
            "rows_truncated": len(rows) > self.max_feedback_rows,
            "preview": preview,
            "note": "An empty/non-empty result alone does not prove semantic correctness.",
        }

    def _bounded_value(self, value: Any) -> Any:
        if value is None or isinstance(value, (bool, int, float)):
            return value
        return self._bounded_text(value)

    def _bounded_text(self, value: Any) -> str:
        text = str(value)
        if len(text) <= self.max_feedback_cell_chars:
            return text
        return text[:self.max_feedback_cell_chars] + "..."

    @staticmethod
    def _get_debug_prompt(
        schema: str,
        question: str,
        sql: str,
        explanation: Dict[str, Any],
        execution_feedback: Dict[str, Any],
    ) -> str:
        return f"""Database schema:
{schema}

Question and evidence:
{question}

Predicted SQL:
```sql
{sql}
```

Clause-by-clause explanation:
{json.dumps(explanation, ensure_ascii=False)}

Bounded read-only execution feedback:
{json.dumps(execution_feedback, ensure_ascii=False)}

Self-debug by comparing the question with the explained behavior. Execution success
does not prove semantic correctness, and an empty result does not by itself prove an
error. Revise only for a concrete schema, syntax, or clause-level semantic defect.
Return JSON only:
{{
  "is_correct": true,
  "confidence": 0.0,
  "needs_refinement": false,
  "errors": [],
  "reason": "specific evidence for the defect, or empty when correct",
  "corrected_sql": "the original SQL when correct; otherwise one minimally corrected SELECT/WITH query"
}}"""
