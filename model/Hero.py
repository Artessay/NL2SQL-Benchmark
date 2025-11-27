
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
            question_str = question + " " + evidence if evidence else question
            schema_str = "\n".join(schema) if isinstance(schema, list) else schema
            
            check_status = self.check_sql_status(sql, schema_str, question_str)
            logger.info(f"Check Status: {check_status}")

            is_correct = check_status.get("is_correct", True)
            if is_correct:
                return sql
            
            # Refine the SQL query
            reason = check_status.get("reason", "")
            sql = self.refine_sql_query(schema_str, question_str, sql, reason)

        return sql


if __name__ == "__main__":
    import utils
    args = utils.get_args()
    model = Hero(args)
    print(model("", "Hello", ""))