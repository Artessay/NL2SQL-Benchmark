
try:
    import json5 as json_parser
except ImportError:  # Strict JSON remains supported in minimal environments.
    import json as json_parser
import logging
import re
from typing import Any, Dict, List, Optional

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model import Base


class Agent(Base):
    def __init__(self, args, **kwargs):
        self.min_refine_confidence = kwargs.pop("min_refine_confidence", 0.75)
        self.max_candidate_result_rows = kwargs.pop("max_candidate_result_rows", 50)
        super().__init__(args, **kwargs)

        self.sql_executor = None

        self.check_prompt = (
            "You are an experienced SQL expert responsible for verifying the correctness of a given SQL query. "
            "Be conservative: only mark a query incorrect when there is a concrete schema, syntax, or semantic defect."
        )
        self.refine_prompt = (
            "As a data analysis expert, correct SQL queries only when the feedback identifies a concrete mistake. "
            "Preserve question literals, filters, joins, and requested output columns unless the feedback explicitly says they are wrong."
        )

    def inference(self, schema:str, question:str, evidence:str = None) -> str:
        query = self.get_prompt(schema, question, evidence)
        response = self.model.generate(query)
        sql = self.fetch_code(response, code_type="sql", default=";")

        return self.check_and_refine_sql(schema, question, evidence, sql)

    def check_and_refine_sql(self, schema: str, question: str, evidence:str, sql: str) -> str:
        question_str = self.format_question(question, evidence)
        schema_str = self.format_schema(schema)
        
        check_status = self.check_sql_status(sql, schema_str, question_str)
        logger.info(f"Check Status: {check_status}")

        is_correct = check_status.get("is_correct", True)
        if is_correct:
            return sql

        if not self.should_refine(check_status, sql):
            logger.info("Skip refinement because the verifier signal is low-confidence.")
            return sql
        
        # Refine the SQL query
        reason = check_status.get("reason", "")
        refined_sql = self.refine_sql_query(schema_str, question_str, sql, reason)

        return self.select_sql_candidate(sql, refined_sql, schema_str, question_str, check_status)

    def check_sql_status(self, sql: str, schema_str: str, question_str: str) -> str:
        # Check whether the SQL query is correct
        check_query = self.get_check_query(schema_str, question_str, sql)
        check_response = self.model.generate(check_query, system_prompt=self.check_prompt)
        logger.debug(f"Check Response: {check_response}")

        check_status_str = self.fetch_code(check_response, code_type="json", default=check_response)
        check_status = self.parse_check_status(check_status_str)

        return check_status

    def parse_check_status(self, check_status_str: str) -> Dict[str, Any]:
        try:
            json_text = self.extract_json_object(check_status_str)
            check_status = json_parser.loads(json_text)
            if not isinstance(check_status, dict):
                raise ValueError("verifier output is not a JSON object")
            return self.normalize_check_status(check_status)
        except Exception as e:
            logger.warning(f"Failed to parse verifier response: {e}")
            return {
                "is_correct": True,
                "reason": f"Verifier response could not be parsed: {e}",
                "confidence": 0.0,
                "needs_refinement": False,
                "errors": [],
            }

    def normalize_check_status(self, check_status: Dict[str, Any]) -> Dict[str, Any]:
        is_correct = self.as_bool(check_status.get("is_correct"), default=True)
        needs_refinement = self.as_bool(check_status.get("needs_refinement"), default=not is_correct)

        try:
            confidence = float(check_status.get("confidence", 1.0 if is_correct else 0.5))
        except (TypeError, ValueError):
            confidence = 1.0 if is_correct else 0.5
        confidence = max(0.0, min(1.0, confidence))

        errors = check_status.get("errors", [])
        if isinstance(errors, str):
            errors = [errors]
        elif not isinstance(errors, list):
            errors = []

        normalized = dict(check_status)
        normalized.update({
            "is_correct": is_correct,
            "reason": str(check_status.get("reason", "")),
            "confidence": confidence,
            "needs_refinement": needs_refinement,
            "errors": errors,
        })
        return normalized

    @staticmethod
    def as_bool(value: Any, default: bool = False) -> bool:
        if isinstance(value, bool):
            return value
        if isinstance(value, str):
            value = value.strip().lower()
            if value in {"true", "yes", "1"}:
                return True
            if value in {"false", "no", "0"}:
                return False
        return default

    @staticmethod
    def extract_json_object(text: str) -> str:
        text = text.strip()
        if text.startswith("{") and text.endswith("}"):
            return text

        start = text.find("{")
        if start < 0:
            raise ValueError("JSON object not found")

        depth = 0
        in_string = False
        escape = False
        quote = ""
        for index in range(start, len(text)):
            char = text[index]
            if in_string:
                if escape:
                    escape = False
                elif char == "\\":
                    escape = True
                elif char == quote:
                    in_string = False
            else:
                if char in {'"', "'"}:
                    in_string = True
                    quote = char
                elif char == "{":
                    depth += 1
                elif char == "}":
                    depth -= 1
                    if depth == 0:
                        return text[start:index + 1]

        raise ValueError("JSON object is incomplete")

    def should_refine(self, check_status: Dict[str, Any], sql: str) -> bool:
        if not sql or sql.strip() == ";":
            return True
        if self.has_execution_failure(check_status):
            return True
        if check_status.get("needs_refinement") and check_status.get("confidence", 0.0) >= self.min_refine_confidence:
            return True
        return False

    @staticmethod
    def has_execution_failure(check_status: Dict[str, Any]) -> bool:
        reason = str(check_status.get("reason", "")).lower()
        markers = [
            "syntax error",
            "runtime error",
            "execution timeout",
            "no data selected",
            "none value",
            "sqlite_error",
        ]
        return any(marker in reason for marker in markers)
    
    def refine_sql_query(self, schema_str: str, question_str: str, sql: str, reason: str) -> str:
        refine_query = self.get_refine_prompt(schema_str, question_str, sql, reason)
        refine_response = self.model.generate(refine_query, system_prompt=self.refine_prompt)
        refined_sql = self.fetch_code(refine_response, code_type="sql", default=";")
        return refined_sql

    def select_sql_candidate(
        self,
        original_sql: str,
        candidate_sql: str,
        schema_str: str,
        question_str: str,
        check_status: Optional[Dict[str, Any]] = None,
    ) -> str:
        check_status = check_status or {}
        original_sql = original_sql.strip() if original_sql else ";"
        candidate_sql = candidate_sql.strip() if candidate_sql else ";"

        if not candidate_sql or candidate_sql == ";":
            logger.info("Reject refined SQL because it is empty.")
            return original_sql
        if self.normalize_sql_text(original_sql) == self.normalize_sql_text(candidate_sql):
            return original_sql

        original_eval = self.evaluate_sql_candidate(original_sql)
        candidate_eval = self.evaluate_sql_candidate(candidate_sql)
        if original_eval and candidate_eval:
            original_ok = original_eval["ok"]
            candidate_ok = candidate_eval["ok"]
            if original_ok and not candidate_ok:
                logger.info(f"Reject refined SQL because execution failed: {candidate_eval['error']}")
                return original_sql
            if not original_ok and candidate_ok:
                return candidate_sql
            if original_ok and candidate_ok:
                lost_anchors = self.lost_question_anchors(question_str, original_sql, candidate_sql)
                if lost_anchors:
                    logger.info(f"Reject refined SQL because it drops question anchors: {lost_anchors}")
                    return original_sql
                if original_eval["signature"] == candidate_eval["signature"]:
                    return original_sql
                if original_eval["is_empty"] and not candidate_eval["is_empty"]:
                    return candidate_sql
                if not original_eval["is_empty"] and candidate_eval["is_empty"]:
                    logger.info("Reject refined SQL because it returns an empty result while the original does not.")
                    return original_sql

        lost_anchors = self.lost_question_anchors(question_str, original_sql, candidate_sql)
        if lost_anchors:
            logger.info(f"Reject refined SQL because it drops question anchors: {lost_anchors}")
            return original_sql

        if check_status.get("confidence", 0.0) >= self.min_refine_confidence or self.has_execution_failure(check_status):
            return candidate_sql
        return original_sql

    def evaluate_sql_candidate(self, sql: str) -> Optional[Dict[str, Any]]:
        sql_executor = getattr(self, "sql_executor", None)
        if sql_executor is None:
            return None

        try:
            result = sql_executor.execute_sql(sql)
        except Exception as e:
            return {
                "ok": False,
                "data": None,
                "signature": None,
                "is_empty": True,
                "error": str(e),
            }

        data = result.get("data")
        ok = "data" in result
        return {
            "ok": ok,
            "data": data,
            "signature": self.result_signature(data) if ok else None,
            "is_empty": ok and len(data) == 0,
            "error": result.get("sqlite_error", ""),
        }

    def result_signature(self, data: List[Any]) -> tuple:
        if data is None:
            return tuple()
        rows = data[:self.max_candidate_result_rows]
        return tuple(tuple(row) if isinstance(row, (list, tuple)) else (row,) for row in rows)

    def lost_question_anchors(self, question_str: str, original_sql: str, candidate_sql: str) -> List[str]:
        lost = []
        for anchor in self.extract_question_anchors(question_str):
            if self.sql_contains_anchor(original_sql, anchor) and not self.sql_contains_anchor(candidate_sql, anchor):
                lost.append(anchor)
        return lost

    @classmethod
    def extract_question_anchors(cls, question_str: str) -> List[str]:
        anchors = []
        quoted_values = re.findall(r"'([^']+)'|\"([^\"]+)\"", question_str)
        anchors.extend(value for pair in quoted_values for value in pair if value)
        anchors.extend(re.findall(r"\b\d{4}[/-]\d{1,2}[/-]\d{1,2}\b", question_str))
        anchors.extend(re.findall(r"(?<![\w.])-?\d+(?:\.\d+)?(?![\w.])", question_str))

        unique_anchors = []
        seen = set()
        for anchor in anchors:
            normalized = cls.normalize_anchor(anchor)
            if normalized not in seen:
                unique_anchors.append(anchor)
                seen.add(normalized)
        return unique_anchors

    @classmethod
    def sql_contains_anchor(cls, sql: str, anchor: str) -> bool:
        normalized_sql = cls.normalize_anchor(sql)
        normalized_anchor = cls.normalize_anchor(anchor)
        if not normalized_anchor:
            return True
        if re.fullmatch(r"-?\d+(?:\.\d+)?", normalized_anchor):
            return re.search(rf"(?<![\w.]){re.escape(normalized_anchor)}(?![\w.])", normalized_sql) is not None
        return normalized_anchor in normalized_sql

    @staticmethod
    def normalize_anchor(text: str) -> str:
        text = str(text).lower().strip()
        text = text.replace("`", "").replace('"', "").replace("'", "")
        def normalize_date(match):
            year, month, day = match.groups()
            return f"{year}-{int(month):02d}-{int(day):02d}"
        text = re.sub(r"\b(\d{4})[/-](\d{1,2})[/-](\d{1,2})\b", normalize_date, text)
        return re.sub(r"\s+", " ", text)

    @staticmethod
    def normalize_sql_text(sql: str) -> str:
        return re.sub(r"\s+", " ", sql or "").strip().rstrip(";").lower()

    @staticmethod
    def format_schema(schema: str) -> str:
        return "\n".join(schema) if isinstance(schema, list) else schema

    @staticmethod
    def format_question(question: str, evidence: str = None) -> str:
        return question + " " + evidence if evidence else question

    def get_check_query(self, schema: str, question: str, sql: str) -> str:
        return f"""The database schema is as follows:
```
{schema}
```

Given the question and predicted SQL query, please reflect that whether the SQL query is correct.

Question: {question}
Predicted SQL Query:  
```
{sql}
```

[Verification Steps]
1. **Understand the Requirement**: Clearly identify the result the user wants to obtain from the QUESTION.  
2. **Analyze the Schema**: Review the tables, columns, data types, and relationships described in the SCHEMA.  
3. **Validate the Query**:  
   - Syntax Correctness: Check if the SQL query follows correct syntax.  
   - Structural Matching: Ensure that all referenced tables and columns exist in the SCHEMA.  
   - Logical Accuracy: Confirm that the query logic correctly implements the user's requirement.  

[Output Requirements] 
Provide the final result in JSON format with the following keys:  
- `"reason"`: String, explaining the reason for correctness or detailing the issues if incorrect.  
- `"is_correct"`: Boolean (true/false), indicating whether the query is correct.  
- `"confidence"`: Float from 0 to 1. Use high confidence only when the issue is concrete and actionable.  
- `"needs_refinement"`: Boolean. Set false when the query is correct or when you are uncertain.  
- `"errors"`: Array of short strings naming concrete error types, such as `"missing_filter"`, `"wrong_literal"`, `"wrong_join"`, `"wrong_select"`, `"syntax_error"`.  

Important rules:
- If the predicted SQL is a reasonable equivalent formulation, mark it correct.
- Do not mark a query incorrect only because it uses aliases, subqueries, `MAX/MIN`, `ORDER BY LIMIT`, or different formatting.
- Never suggest changing dates, numbers, string literals, or IDs from the question unless the schema or evidence clearly proves they are wrong.
- If you are uncertain, mark `"is_correct": true`, set `"confidence"` to 0.5 or lower, and set `"needs_refinement": false`.

[Example Output]
```json
{{
  "reason": "The reason for correctness or the issues if incorrect.",
    "is_correct": true / false,
    "confidence": 0.0-1.0,
    "needs_refinement": true / false,
    "errors": []
}}
```
"""
    
    def get_refine_prompt(self, schema: str, question: str, sql: str, reason: str) -> str:
        
        # base prompt for the question
        base_prompt = "The database schema is as follows:\n```\n" + schema + "\n```\nThe question is:\n" + question
        
        refine_prompt = "\nThe previous predicted SQL query is:\n```sql\n" + sql + "\n```" + \
            "\nThe human expert feedback for the SQL query is:\n" + reason
        
        base_ans_prompt = "\n" + "Based on the human expert feedback, please correct only the previous concrete mistakes and generate a new correct SQL query. Preserve all unchanged question literals, IDs, dates, filters, joins, and requested output columns from the previous SQL. If the feedback is uncertain or not actionable, return the previous SQL unchanged. Only write the correct sql with no comments." 

        return base_prompt + refine_prompt + base_ans_prompt
    

if __name__ == "__main__":
    import utils
    args = utils.get_args()
    model = Agent(args)
    print(model("", "Hello", ""))
