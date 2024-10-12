import random
import itertools
from typing import List

from model import Base
from tools import SqlExecutor

class Vote(Base):
    def __init__(self, args):
        temperature = 0.7
        super().__init__(args, temperature=temperature)

        self.max_num_permutations = 10
        self.sql_executor = None

    def inference(self, schema:List[str], question:str, evidence:str = None) -> str:
        assert isinstance(schema, list)

        all_permutations = list(itertools.permutations(schema))
        random.shuffle(all_permutations)
        random_permutations = all_permutations[:self.max_num_permutations]

        query_list = [
            self.get_prompt(
                "\n".join(permutation),
                question,
                evidence
            ) for permutation in random_permutations
        ]
        response_list = self.model.generate(query_list)
        sql_list = [
            self.fetch_code(response, code_type="sql", default=";") for response in response_list
        ]
        
        assert self.sql_executor is not None

    
