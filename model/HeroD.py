import logging
from func_timeout import FunctionTimedOut

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model.HeroS import HeroS
from tools.LogicalAnalyzer import LogicalAnalyzer


class HeroD(HeroS):
    def __init__(self, args, **kwargs):
        super().__init__(args, **kwargs)

        self.lp_suggest_prompt = "You are an expert SQL analyst. Carefully examine the given SQL query and its logical plan, reflect that whether the SQL query is correct, and provide a detailed, step-by-step explaination if the query is not correct."
        self.logical_analyzer = LogicalAnalyzer()

    def check_and_refine_sql(self, schema: str, question: str, evidence:str, sql: str) -> str:
        for _ in range(self.max_num_iteration):
            question_str = question + " " + evidence if evidence else question
            schema_str = "\n".join(schema) if isinstance(schema, list) else schema
            
            check_status = self.check_sql_status(sql, schema_str, question_str)
            logger.info(f"Check Status: {check_status}")

            is_correct = check_status.get("is_correct", True)
            if is_correct:
                return sql
            
            # Refine the SQL query
            reason = check_status.get("reason", "")
            logical_plan = check_status.get("logical_plan", None)
            sql = self.refine_sql_query(schema_str, question_str, sql, reason, logical_plan)

        return sql

    def check_sql_status(self, sql: str, schema_str: str, question_str: str) -> str:
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


    def refine_sql_query(self, schema_str: str, question_str: str, sql: str, reason: str, logical_plan: str) -> str:
        if logical_plan:
            suggestion = self.suggest_with_lp_for_correction(schema_str, question_str, sql, logical_plan)
        else:
            suggestion = self.suggest_for_correction(schema_str, question_str, sql, reason)
        logger.info(f"Suggestion: {suggestion}")

        refine_query = self.get_refine_prompt(schema_str, question_str, sql, suggestion)
        refine_response = self.model.generate(refine_query, system_prompt=self.refine_prompt)
        sql = self.fetch_code(refine_response, code_type="sql", default=";")

        return sql

    def suggest_with_lp_for_correction(self, schema: str, question: str, sql: str, reason: str):
        suggest_query = self.get_suggestion_prompt(schema, question, sql, reason)
        suggest_response = self.model.generate(suggest_query, system_prompt=self.suggest_prompt)
        return suggest_response

    def get_lp_suggestion_prompt(self, schema, question, sql, logical_plan):
        return f"""Question: {question}

Database schema:
{schema}

Predicted SQL query:
{sql}

Predicted logical plan:
{logical_plan}

Human expert feedback:
Not sure whether the SQL query is correct or not. The query may contain semantic error, please check it carefully.


[Verification Steps]
1. **Understand the Requirement**: Clearly identify the result the user wants to obtain from the question.  
2. **Validate the Query**: Confirm that the query logic correctly implements the user's requirement.  
3. **Analyze the Logical Plan**: Analyze the logical plan to identify the mistake if any.
4. **Suggest Correction**: Provide a step-by-step suggestion for correcting the query if the query is incorrect.

[Suggestion Requirements]
1.   Explain clearly why the mistake occurs.
2.   Identify which part of the query is incorrect, redundant, or unnecessary.
3.   Describe the implications of this mistake on query execution or results.
4.   Provide a concise, understandable explanation suitable for someone familiar with SQL and query planning.

Output:
A detailed analysis for the SQL query."""
