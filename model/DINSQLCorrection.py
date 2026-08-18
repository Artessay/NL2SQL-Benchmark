"""DIN-SQL self-correction-stage baseline."""

import logging

from model.Agent import Agent
from model.DACCorrection import _ReadOnlyCorrectionMixin


logger = logging.getLogger(__name__)


class DINSQLCorrection(_ReadOnlyCorrectionMixin, Agent):
    """Apply DIN-SQL's final self-correction checklist to a generated SQL."""

    def __init__(self, args, **kwargs):
        kwargs.setdefault("min_refine_confidence", 0.80)
        super().__init__(args, **kwargs)
        self.din_system_prompt = (
            "You are the conservative self-correction module of a text-to-SQL "
            "pipeline. Keep equivalent queries unchanged and return JSON only."
        )

    def check_and_refine_sql(
        self, schema: str, question: str, evidence: str, sql: str
    ) -> str:
        original_sql = sql
        schema_str = self.format_schema(schema)
        question_str = self.format_question(question, evidence)
        try:
            response = self.model.generate(
                self._get_din_correction_prompt(schema_str, question_str, original_sql),
                system_prompt=self.din_system_prompt,
            )
            payload = self._parse_json_response(response)
            status = self.normalize_check_status(payload)
        except Exception as exc:
            logger.warning("DIN-SQL correction could not be parsed; retain original SQL: %s", exc)
            return original_sql

        logger.info("DIN-SQL correction status: %s", status)
        if not self._is_actionable(status):
            return original_sql
        candidate_sql = self._corrected_sql(payload)
        return self._select_safe_correction(
            original_sql, candidate_sql, schema_str, question_str, status
        )

    @staticmethod
    def _get_din_correction_prompt(schema: str, question: str, sql: str) -> str:
        return f"""Database schema:
{schema}

Question and evidence:
{question}

Predicted SQL:
```sql
{sql}
```

Perform the DIN-SQL self-correction stage. Check, in order:
1. Every selected column answers exactly what was requested.
2. Tables, columns, aliases, and join keys exist and joins do not add/drop rows.
3. Question literals and comparison directions are preserved exactly.
4. WHERE versus HAVING, aggregation, DISTINCT, GROUP BY, and nesting are correct.
5. ORDER BY direction and LIMIT implement superlatives/top-k requirements.
6. SQLite syntax is valid.

Different but semantically equivalent formulations must remain unchanged. Do not
change anything based on style or uncertainty. Return one JSON object only:
{{
  "is_correct": true,
  "confidence": 0.0,
  "needs_refinement": false,
  "errors": [],
  "reason": "a concrete clause-level defect, or empty when correct",
  "corrected_sql": "the original SQL when correct; otherwise one minimally corrected SELECT/WITH query"
}}"""

