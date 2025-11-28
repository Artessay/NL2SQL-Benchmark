import logging
from func_timeout import FunctionTimedOut

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model.HeroS import HeroS
from tools.LogicalAnalyzer import LogicalAnalyzer


class HeroD(HeroS):
    def __init__(self, args, **kwargs):
        super().__init__(args, **kwargs)

        self.lp_suggest_prompt = (
            "You are an expert SQL analyst. Carefully examine the given syntactically correct SQL query and its logical plan. "
            "Your task is to verify whether the SQL query is semantically correct given the user's intent. "
            "If the query is not correct, provide a detailed step-by-step explanation of the mistake."
        )
        self.logical_analyzer = LogicalAnalyzer()

    def check_and_refine_sql(self, schema: str, question: str, evidence:str, sql: str) -> str:
        for _ in range(self.max_num_iteration):
            question_str = question + " " + evidence if evidence else question
            schema_str = "\n".join(schema) if isinstance(schema, list) else schema
            
            check_status = self.check_sql_status(sql, question_str)
            logger.info(f"Check Status: {check_status}")

            is_correct = check_status.get("is_correct", True)
            if is_correct:
                return sql
            
            # get suggestion for refinement
            logical_plan = check_status.get("logical_plan", None)
            if logical_plan:
                suggestion = self.suggest_with_lp_for_correction(schema_str, question_str, sql, logical_plan)
                if suggestion.lower().strip() == "correct":
                    return sql
            else:
                reason = check_status.get("reason", "")
                suggestion = self.suggest_for_correction(schema_str, question_str, sql, reason)
            logger.info(f"Suggestion: {suggestion}")
            
            # Refine the SQL query
            sql = self.refine_sql_query(schema_str, question_str, sql, suggestion)

        return sql

    def check_sql_status(self, sql: str, question_str: str) -> str:
        try:
            result = self.sql_executor.execute_sql(sql)
            if "data" in result:
                db_name = self.sql_executor.database_path.split("/")[-1].split(".")[0]
                return self.logical_analyzer(db_name=db_name, question=question_str, sql=sql)
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

    def refine_sql_query(self, schema_str: str, question_str: str, sql: str, suggestion: str) -> str:
        refine_query = self.get_refine_prompt(schema_str, question_str, sql, suggestion)
        refine_response = self.model.generate(refine_query, system_prompt=self.refine_prompt)
        sql = self.fetch_code(refine_response, code_type="sql", default=";")

        return sql

    def suggest_with_lp_for_correction(self, schema: str, question: str, sql: str, logical_plan: str):
        lp_suggest_query = self.get_lp_suggestion_prompt(schema, question, sql, logical_plan)
        lp_suggest_response = self.model.generate(lp_suggest_query, system_prompt=self.lp_suggest_prompt)
        return lp_suggest_response

    def get_lp_suggestion_prompt(self, schema, question, sql, logical_plan):
        return f"""[Input Information]
Question: {question}

Database Schema:
{schema}

Predicted SQL Query:
{sql}

Logical Plan for the Predicted SQL Query:
{logical_plan}

[Analysis Steps]
1. **Understand the Requirement**: Clearly identify user's intent and the result the user wants to obtain from the question.  
2. **Validate the Query**: Determine that the query logic correctly implements the user's requirement.  
3. **Analyze the Logical Plan**: Examine the logical plan, tracing how the SQL would execute and highlighting any potential logical missteps.
4. **Mistake Identification**: If errors or mismatches are found, identify and explain them in detail.
    - Explain clearly why the mistake occurs.
    - Identify which part of the query is incorrect, redundant, or unnecessary.
    - Describe the implications of this mistake on query execution or results.
    - Provide a concise, understandable explanation suitable for someone familiar with SQL.
  If the query is correct, then briefly confirm correctness.

[Output Requirements]
If the query may contain potential mistakes, then provide a detailed, step-by-step explanation of the mistake. The explanations should be concise but thorough.
Otherwise, just output a single word "correct" without any other text."""
