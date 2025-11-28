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
