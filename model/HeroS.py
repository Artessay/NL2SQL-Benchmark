
import json5
import logging
from func_timeout import FunctionTimedOut

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model.Hero import Hero


class HeroS(Hero):
    def __init__(self, args, **kwargs):
        super().__init__(args, **kwargs)

        self.suggest_prompt = "You are an expert SQL analyst. Carefully examine the given SQL query and the potiential mistake. Then provide a detailed, step-by-step explanation for the mistake."


    def check_sql_status(self, sql: str, schema_str: str, question_str: str) -> str:
        try:
            result = self.sql_executor.execute_sql(sql)
            if "data" in result:
                status = "Success"
            else:
                status = "[Syntax Error] " + result.get("sqlite_error", "")
        except FunctionTimedOut:
            status = "[Execution Timeout] Query execution exceeded time limit."
        except Exception as e:
            status = "[Runtime Error] " + str(e)
        
        if status == "Success":
            return {"is_correct": True, "reason": ""}
        else:
            return {"is_correct": False, "reason": status}


    def refine_sql_query(self, schema_str: str, question_str: str, sql: str, reason: str) -> str:
        suggestion = self.suggest_for_correction(schema_str, question_str, sql, reason)
        logger.info(f"Suggestion: {suggestion}")

        refine_query = self.get_refine_prompt(schema_str, question_str, sql, suggestion)
        refine_response = self.model.generate(refine_query, system_prompt=self.refine_prompt)
        sql = self.fetch_code(refine_response, code_type="sql", default=";")

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
    model = HeroS(args)
    print(model("", "Hello", ""))