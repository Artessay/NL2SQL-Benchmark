
import logging

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model.Agent import Agent
from tools import SqlExecutor


class Hero(Agent):
    def __init__(self, args, **kwargs):
        super().__init__(args, **kwargs)

        self.sql_executor: SqlExecutor = None
        self.max_num_iteration = kwargs.pop("max_num_iteration", 3)

    def check_and_refine_sql(self, schema: str, question: str, evidence:str, sql: str) -> str:
        for _ in range(self.max_num_iteration):
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
            suggestion = self.suggest_for_correction(schema_str, question_str, sql, reason)
            logger.info(f"Suggestion: {suggestion}")

            candidate_sql = self.refine_sql_query(schema_str, question_str, sql, suggestion)
            next_sql = self.select_sql_candidate(sql, candidate_sql, schema_str, question_str, check_status)
            if self.normalize_sql_text(next_sql) == self.normalize_sql_text(sql):
                return sql
            sql = next_sql

        return sql

    def suggest_for_correction(self, schema: str, question: str, sql: str, reason: str):
        suggest_query = self.get_suggestion_prompt(schema, question, sql, reason)
        suggest_response = self.model.generate(suggest_query, system_prompt=self.suggest_prompt)
        return suggest_response

    def get_suggestion_prompt(self, schema, question, sql, reason):
        return f"""Question: {question}

Database schema:
{schema}

Predicted SQL query:
{sql}

Identified mistake:
{reason}

Instructions for analysis:
1.   Explain clearly why the mistake occurs.
2.   Identify which part of the query is incorrect, redundant, or unnecessary.
3.   Describe the implications of this mistake on query execution or results.
4.   Provide a concise, understandable explanation suitable for someone familiar with SQL and query planning.

Output:
A detailed error analysis."""


if __name__ == "__main__":
    import utils
    args = utils.get_args()
    model = Hero(args)
    print(model("", "Hello", ""))