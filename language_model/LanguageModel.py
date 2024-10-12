from typing import Dict, List, Union
from abc import abstractmethod

class LanguageModel():
    def __init__(self, **kwargs) -> None:
        self.max_new_tokens = kwargs.pop("max_new_tokens", 512)

        self.system_prompt = "As a data analysis expert, you are to extract the necessary information from the data provided and output the corresponding SQL query based on the user's question."

    @abstractmethod
    def chat(self, messages: List[Dict[str, str]]) -> str:
        raise NotImplementedError()
    
    @abstractmethod
    def chat_batch(self, messages: List[List[Dict[str, str]]]) -> List[str]:
        raise NotImplementedError()

    def generate(self, prompt: Union[str | List[str]] , system_prompt: str = None) -> str:
        system_prompt = system_prompt or self.system_prompt
        
        if isinstance(prompt, list):
            messages = [
                [
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": single_prompt}
                ]
                for single_prompt in prompt
            ]
            return self.chat_batch(messages)
        else:
            messages = [
                {"role": "system", "content": system_prompt},
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
