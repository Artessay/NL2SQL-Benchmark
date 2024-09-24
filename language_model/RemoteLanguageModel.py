import os
from openai import OpenAI
from typing import Dict, List

from .LanguageModel import LanguageModel

class RemoteLanguageModel(LanguageModel):
    def __init__(self, model_name, **kwargs) -> None:
        super().__init__(**kwargs)

        api_key = os.environ.get("OPENAI_API_KEY", None)
        base_url = os.environ.get("OPENAI_API_BASE_URL", None)
        
        self.model_name = model_name
        self.temperature = kwargs.pop("temperature", 0.0)
        self.client = OpenAI(api_key=api_key, base_url=base_url)

    def chat(self, messages: List[Dict[str, str]]) -> str:
        response = self.client.chat.completions.create(
            model=self.model_name,
            messages=messages,
            temperature=self.temperature,
        )

        response = response.choices[0].message.content
        return response