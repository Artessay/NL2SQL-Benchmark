"""Decomposed Automated Correction (DAC) correction-stage baseline.

This module intentionally implements only DAC's correction stage.  The
repository's ordinary generator produces the initial SQL; entity links and a
SQL skeleton are then predicted independently and used to verify/correct it.
"""

import json
import logging
import re
from typing import Any, Dict, Optional

try:
    import json5 as json_parser
except ImportError:  # pragma: no cover - json is always available
    json_parser = json

from model.Agent import Agent
from model._sql_safety import has_quoted_function_call


logger = logging.getLogger(__name__)


class _ReadOnlyCorrectionMixin:
    """Safety and parsing helpers shared by model-only correction baselines."""

    _forbidden_sql_tokens = {
        "alter", "analyze", "attach", "begin", "commit", "create", "delete",
        "detach", "drop", "insert", "pragma", "reindex", "release", "replace",
        "rollback", "savepoint", "transaction", "update", "vacuum",
        "load_extension", "writefile",
    }
    _side_effect_functions = {"load_extension", "writefile"}

    def __call__(self, schema: str, question: str, evidence: str = None) -> str:
        """Run one pipeline without Base's hidden, unverified regeneration fallback."""
        try:
            sql = self.inference(schema, question, evidence)
        except KeyboardInterrupt:
            raise
        except Exception:
            logger.exception("Semantic correction pipeline failed.")
            return ";"

        sql = self._normalize_sql_response(sql)
        if not self.is_read_only_sql(sql):
            logger.warning("Blocking final output that is not one read-only SELECT/WITH query.")
            return ";"
        return sql

    @staticmethod
    def _sql_control_text(sql: str) -> str:
        """Return SQL outside strings/comments, preserving statement markers."""
        output = []
        index = 0
        quote = None
        while index < len(sql):
            char = sql[index]
            next_char = sql[index + 1] if index + 1 < len(sql) else ""
            if quote is not None:
                if quote == "]":
                    if char == "]":
                        quote = None
                elif char == quote:
                    if next_char == quote:  # SQL's doubled-quote escape.
                        index += 1
                    else:
                        quote = None
                output.append(" ")
            elif char in {"'", '"', "`"}:
                quote = char
                output.append(" ")
            elif char == "[":
                quote = "]"
                output.append(" ")
            elif char == "-" and next_char == "-":
                while index < len(sql) and sql[index] not in "\r\n":
                    output.append(" ")
                    index += 1
                continue
            elif char == "/" and next_char == "*":
                output.extend((" ", " "))
                index += 2
                while index < len(sql):
                    if sql[index:index + 2] == "*/":
                        output.extend((" ", " "))
                        index += 2
                        break
                    output.append(" ")
                    index += 1
                continue
            else:
                output.append(char)
            index += 1
        return "".join(output)

    @classmethod
    def is_read_only_sql(cls, sql: str) -> bool:
        """Conservatively admit one SELECT/WITH statement only."""
        if not isinstance(sql, str) or not sql.strip() or sql.strip() == ";":
            return False
        if has_quoted_function_call(sql, cls._side_effect_functions):
            return False
        control_text = cls._sql_control_text(sql)
        statements = [part for part in control_text.split(";") if part.strip()]
        if len(statements) != 1:
            return False
        tokens = re.findall(r"[A-Za-z_][A-Za-z0-9_]*", statements[0].lower())
        if not tokens or tokens[0] not in {"select", "with"}:
            return False
        if any(token in cls._forbidden_sql_tokens for token in tokens):
            return False
        return True

    @staticmethod
    def _normalize_sql_response(sql: Any) -> str:
        if not isinstance(sql, str):
            return ";"
        return re.sub(
            r"^(?:sql|sqlite)\s*\r?\n",
            "",
            sql.strip(),
            count=1,
            flags=re.IGNORECASE,
        ).strip() or ";"

    def evaluate_sql_candidate(self, sql: str) -> Optional[Dict[str, Any]]:
        """Agent-compatible execution evaluation with a strict read-only gate."""
        sql_executor = getattr(self, "sql_executor", None)
        if sql_executor is None:
            return None
        if not self.is_read_only_sql(sql):
            return {
                "ok": False,
                "data": None,
                "signature": None,
                "is_empty": True,
                "error": "blocked: only one read-only SELECT/WITH statement is allowed",
            }
        try:
            result = sql_executor.execute_sql(sql)
        except Exception as exc:
            return {
                "ok": False,
                "data": None,
                "signature": None,
                "is_empty": True,
                "error": str(exc),
            }

        if "data" not in result:
            return {
                "ok": False,
                "data": None,
                "signature": None,
                "is_empty": True,
                "error": result.get("sqlite_error", "query execution failed"),
            }
        data = result.get("data") or []
        return {
            "ok": True,
            "data": data,
            # BIRD EX ignores row order and duplicate rows.  Use the complete
            # result, rather than Agent's first-50-row prefix, for the same
            # equivalence decision during correction.
            "signature": self._bird_result_signature(data),
            "is_empty": len(data) == 0,
            "error": "",
        }

    @classmethod
    def _bird_result_signature(cls, data: Any) -> frozenset:
        rows = data if isinstance(data, (list, tuple)) else [data]
        return frozenset(cls._freeze_sql_value(row) for row in rows)

    @classmethod
    def _freeze_sql_value(cls, value: Any) -> Any:
        if isinstance(value, dict):
            return tuple(sorted((str(key), cls._freeze_sql_value(item)) for key, item in value.items()))
        if isinstance(value, (list, tuple)):
            return tuple(cls._freeze_sql_value(item) for item in value)
        if isinstance(value, set):
            return frozenset(cls._freeze_sql_value(item) for item in value)
        try:
            hash(value)
            return value
        except TypeError:
            return repr(value)

    def _parse_json_response(self, response: str) -> Dict[str, Any]:
        text = self.fetch_code(response, code_type="json", default=response).strip()
        parsed = json_parser.loads(self.extract_json_object(text))
        if not isinstance(parsed, dict):
            raise ValueError("response is not a JSON object")
        return parsed

    def _corrected_sql(self, payload: Dict[str, Any]) -> str:
        value = payload.get("corrected_sql", payload.get("SQL", payload.get("sql", "")))
        if not isinstance(value, str):
            return ";"
        extracted = self.fetch_code(value, code_type="sql", default=";")
        return self._normalize_sql_response(extracted)

    def _is_actionable(self, status: Dict[str, Any]) -> bool:
        if status.get("is_correct", True) or not status.get("needs_refinement", False):
            return False
        if status.get("confidence", 0.0) < self.min_refine_confidence:
            return False
        errors = status.get("errors", [])
        if not isinstance(errors, list) or not any(
            self._is_concrete_error(error) for error in errors
        ):
            return False
        raw_reason = status.get("reason", "")
        reason = raw_reason.strip() if isinstance(raw_reason, str) else ""
        if not reason:
            return False
        uncertainty = ("not sure", "uncertain", "possibly", "maybe", "might be")
        return not any(marker in reason.lower() for marker in uncertainty)

    @staticmethod
    def _is_concrete_error(error: Any) -> bool:
        if isinstance(error, str):
            return bool(error.strip())
        if not isinstance(error, dict):
            return False
        return bool(
            isinstance(error.get("type"), str)
            and error["type"].strip()
            and isinstance(error.get("description"), str)
            and error["description"].strip()
        )

    def _select_safe_correction(
        self,
        original_sql: str,
        candidate_sql: str,
        schema_str: str,
        question_str: str,
        status: Dict[str, Any],
    ) -> str:
        original_sql = self._normalize_sql_response(original_sql)
        candidate_sql = self._normalize_sql_response(candidate_sql)
        if not self.is_read_only_sql(candidate_sql):
            logger.info("Reject correction because it is not one read-only SQL statement.")
            return original_sql
        try:
            return self.select_sql_candidate(
                original_sql, candidate_sql, schema_str, question_str, status
            )
        except Exception as exc:
            logger.warning("Candidate selection failed; retain original SQL: %s", exc)
            return original_sql


class DACCorrection(_ReadOnlyCorrectionMixin, Agent):
    """DAC entity-link/skeleton comparison followed by conservative repair."""

    def __init__(self, args, **kwargs):
        kwargs.setdefault("min_refine_confidence", 0.80)
        super().__init__(args, **kwargs)
        self.entity_system_prompt = (
            "Extract grounded database entities for text-to-SQL correction. "
            "Do not inspect or infer from any predicted SQL. Return JSON only."
        )
        self.skeleton_system_prompt = (
            "Infer an abstract SQL plan from the question and schema independently "
            "of any predicted SQL. Return JSON only."
        )
        self.verify_system_prompt = (
            "Act as a conservative DAC verifier. Report only concrete mismatches "
            "between the candidate SQL and the independently inferred requirements."
        )

    def check_and_refine_sql(
        self, schema: str, question: str, evidence: str, sql: str
    ) -> str:
        original_sql = sql
        schema_str = self.format_schema(schema)
        question_str = self.format_question(question, evidence)
        try:
            entity_links = self._predict_entity_links(schema_str, question_str)
            skeleton = self._predict_sql_skeleton(schema_str, question_str)
            status = self._verify_decomposition(
                schema_str, question_str, original_sql, entity_links, skeleton
            )
        except Exception as exc:
            logger.warning("DAC decomposition failed; retain original SQL: %s", exc)
            return original_sql

        logger.info("DAC verification status: %s", status)
        if not self._is_actionable(status):
            return original_sql

        try:
            candidate_sql = self._repair_from_decomposition(
                schema_str,
                question_str,
                original_sql,
                entity_links,
                skeleton,
                status,
            )
        except Exception as exc:
            logger.warning("DAC correction failed; retain original SQL: %s", exc)
            return original_sql
        return self._select_safe_correction(
            original_sql, candidate_sql, schema_str, question_str, status
        )

    def _predict_entity_links(self, schema: str, question: str) -> Dict[str, Any]:
        prompt = f"""Database schema:
{schema}

Question and evidence:
{question}

Independently identify only entities grounded by the question/evidence and schema.
Return this JSON shape:
{{
  "tables": ["required table"],
  "columns": ["table.column"],
  "values": [{{"value": "literal", "column": "table.column or unknown"}}],
  "relationships": ["required join relationship"],
  "ambiguities": ["anything not provable from the inputs"]
}}"""
        response = self.model.generate(prompt, system_prompt=self.entity_system_prompt)
        return self._parse_json_response(response)

    def _predict_sql_skeleton(self, schema: str, question: str) -> Dict[str, Any]:
        prompt = f"""Database schema:
{schema}

Question and evidence:
{question}

Infer the required SQL structure without seeing a candidate query. Do not invent
literals or schema elements. Return this JSON shape:
{{
  "outputs": ["requested expression"],
  "sources": ["required table role"],
  "joins": ["required relationship"],
  "filters": ["required condition"],
  "aggregation": ["required aggregate/grouping"],
  "ordering_limit": ["required ordering or limit"],
  "set_or_nested_operations": ["required operation"],
  "skeleton": "abstract SQL skeleton"
}}"""
        response = self.model.generate(prompt, system_prompt=self.skeleton_system_prompt)
        return self._parse_json_response(response)

    def _verify_decomposition(
        self,
        schema: str,
        question: str,
        sql: str,
        entity_links: Dict[str, Any],
        skeleton: Dict[str, Any],
    ) -> Dict[str, Any]:
        prompt = f"""Database schema:
{schema}

Question and evidence:
{question}

Independent entity links:
{json.dumps(entity_links, ensure_ascii=False)}

Independent SQL skeleton:
{json.dumps(skeleton, ensure_ascii=False)}

Candidate SQL:
```sql
{sql}
```

Compare the candidate clause by clause with the two independent predictions.
Equivalent SQL formulations are correct. Treat ambiguities as uncertainty, not
errors. Return JSON only:
{{
  "is_correct": true,
  "confidence": 0.0,
  "needs_refinement": false,
  "errors": [],
  "reason": "specific clause-level evidence, or empty when correct"
}}"""
        response = self.model.generate(prompt, system_prompt=self.verify_system_prompt)
        status_text = self.fetch_code(response, code_type="json", default=response)
        return self.parse_check_status(status_text)

    def _repair_from_decomposition(
        self,
        schema: str,
        question: str,
        sql: str,
        entity_links: Dict[str, Any],
        skeleton: Dict[str, Any],
        status: Dict[str, Any],
    ) -> str:
        prompt = f"""Database schema:
{schema}

Question and evidence:
{question}

Original SQL:
```sql
{sql}
```

Independent entity links:
{json.dumps(entity_links, ensure_ascii=False)}

Independent SQL skeleton:
{json.dumps(skeleton, ensure_ascii=False)}

Concrete verifier errors: {json.dumps(status.get('errors', []), ensure_ascii=False)}
Concrete verifier reason: {status.get('reason', '')}

Make the smallest correction that fixes only those concrete errors. Preserve all
unmentioned literals, filters, joins, output columns, and equivalent formulations.
Return one SQLite SELECT/WITH query only, with no explanation or comments."""
        response = self.model.generate(prompt, system_prompt=self.refine_prompt)
        extracted = self.fetch_code(response, code_type="sql", default=";")
        return self._normalize_sql_response(extracted)
