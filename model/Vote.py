import random
import logging
import itertools
from typing import List
from collections import Counter

logging.basicConfig(level=logging.INFO) 
logger = logging.getLogger(__name__)

from model import Base
from tools import SqlExecutor

class Vote(Base):
    def __init__(self, args):
        temperature = 0.0
        self.parent = super()
        self.parent.__init__(args, temperature=temperature)

        self.max_num_permutations = 10
        self.sql_executor: SqlExecutor = None

    def inference(self, schema:List[str], question:str, evidence:str = None) -> str:
        schema_list = self._sample_queries(schema)
        sql_list = [
            self.parent.inference(list(shema), question, evidence) for shema in schema_list
        ]
        return self._vote_sql(sql_list)
        

    def _sample_queries(self, schema:List[str]) -> List[List[str]]:
        assert isinstance(schema, list)

        all_permutations = list(itertools.permutations(schema))
        random.shuffle(all_permutations)
        random_schemas = all_permutations[:self.max_num_permutations]

        return random_schemas

    def _vote_sql(self, sql_list:List[str]) -> str:
        assert self.sql_executor is not None

        logger.info(f"{len(sql_list)} SQLs are sampled")
        
        # (sql, result) pair list
        result_list = [] 
        for sql in sql_list:
            result_dict = self.sql_executor.execute_sql(sql)
            if "data" in result_dict:
                result_list.append((sql, result_dict["data"]))
            else:
                logger.warning(f"SQL execution failed: {result_dict['sqlite_error']}")

        logger.info(f"{len(result_list)} SQLs are valid")
        # list is unhashable, so convert to tuple
        result_list = [(sql, tuple(sorted(result))) for sql, result in result_list]

        if len(result_list) == 0:
            raise Exception("No valid SQL")

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
