import random
import logging
import itertools
from typing import List
from collections import Counter
from concurrent.futures import ThreadPoolExecutor, as_completed

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

if __name__ == '__main__':
    import os, sys
    sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from model import Base
from tools import SqlExecutor

class Vote(Base):
    def __init__(self, args, **kwargs):
        temperature = kwargs.pop("temperature", 0.0)
        self.max_num_permutations = kwargs.pop("max_num_permutations", 5)

        self.parent = super()
        self.parent.__init__(args, temperature=temperature)

        self.sql_executor: SqlExecutor = None

    def inference(self, schema:List[str], question:str, evidence:str = None) -> str:
        schema_list = self._sample_queries(schema)

        # generate sql
        query_list = [self.get_prompt(list(shema), question, evidence) for shema in schema_list]
        response_list = self.model.generate(query_list)
        sql_list = [self.fetch_code(response, code_type="sql", default=";") for response in response_list]
        
        return self._vote_sql(sql_list)
        

    def _sample_queries(self, schema:List[str]) -> List[List[str]]:
        assert isinstance(schema, list)

        all_permutations = list(itertools.permutations(schema))
        random.shuffle(all_permutations)
        random_schemas = all_permutations[:self.max_num_permutations]

        return random_schemas
    
    def _execute_and_collect(self, sql):
        try:
            result_dict = self.sql_executor.execute_sql(sql)
            result = result_dict.get("data")
            if result:
                return (sql, result)
            else:
                logger.warning(f"SQL execution failed: {result_dict.get('sqlite_error')}")
        except:
            logger.warning(f"SQL execution timeout")
        
        return None

    def _vote_sql(self, sql_list:List[str]) -> str:
        assert self.sql_executor is not None

        logger.info(f"{len(sql_list)} SQLs are sampled")

        
        # (sql, result) pair list
        result_list = [] 
        with ThreadPoolExecutor(max_workers=self.max_num_permutations) as executor:
            future_to_sql = {executor.submit(self._execute_and_collect, sql): sql for sql in sql_list}
            for future in as_completed(future_to_sql):
                result = future.result()
                if result:  # check if result is valid
                    result_list.append(result)
            
        logger.info(f"{len(result_list)} SQLs are valid")
        # list is unhashable, so convert to tuple
        result_list = [(sql, tuple(sorted(result))) for sql, result in result_list]

        if len(result_list) == 0:
            raise Exception("No valid SQL")
        elif len(result_list) == 1:
            return result_list[0][0]

        try:
            # count results
            result_counter = Counter([result for _, result in result_list])
            
            # get most common result
            most_common_result = result_counter.most_common(1)[0][0]

            # get sql having the same result with most common result
            for sql, result in result_list:
                if result == most_common_result:
                    return sql
        except:
            sql_counter = Counter([sql for sql, _ in result_list])
            return sql_counter.most_common(1)[0][0]

if __name__ == "__main__":
    import utils
    args = utils.get_args()
    model = Vote(args, max_num_permutations=2)

    try:
        model.inference(["A", "B"], "Hello", "")
        assert False and "Should not reach here"
    except Exception as e:
        logger.info(e)