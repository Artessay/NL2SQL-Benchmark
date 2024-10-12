import random
import itertools
from typing import List

from model import Base

class Vote(Base):
    def __init__(self, args):
        temperature = 0.7
        super().__init__(args, temperature=temperature)

        max_num_permutations = 10

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
        from pprint import pprint
        pprint(response_list)
        exit(0)

        return self.fetch_code(response, code_type="sql", default=";")
