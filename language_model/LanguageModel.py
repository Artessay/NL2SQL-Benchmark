from typing import Dict, List
from abc import abstractmethod

class LanguageModel():
    def __init__(self, **kwargs) -> None:
        self.max_new_tokens = kwargs.pop("max_new_tokens", 512)

        # "You are a powerful data analysist, reading database schema and write SQL to analyse data."
        self.system_prompt = "As a data analysis expert, you are to extract the necessary information from the data provided and output the corresponding SQL query based on the user's question."

    @abstractmethod
    def chat(self, messages: List[Dict[str, str]]) -> str:
        raise NotImplementedError()

    def generate(self, prompt):
        messages = [
            {"role": "system", "content": self.system_prompt},
            {"role": "user", "content": prompt}
        ]
        return self.chat(messages)

    def generate_sql(self, prompt):
        response = self.generate(prompt)

        # fetch code block
        if "```" in response:
            sql = response.split("```")[1]
        else:
            sql = response

        if 'sql\n' in sql[:4]:
            sql = sql[4:]

        if sql == "":
            sql = ";"

        return sql
