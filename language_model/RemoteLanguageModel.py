import os
import concurrent.futures

from openai import OpenAI
from typing import Dict, List

from tenacity import retry, stop_after_attempt, wait_exponential

from .LanguageModel import LanguageModel

class RemoteLanguageModel(LanguageModel):
    def __init__(self, model_name, **kwargs) -> None:
        super().__init__(**kwargs)

        api_key = os.environ.get("OPENAI_API_KEY", None)
        base_url = os.environ.get("OPENAI_API_BASE_URL", None)
        
        self.model_name = model_name
        self.temperature = kwargs.pop("temperature", 0.0)
        self.timeout = kwargs.pop("timeout", 60)
        self.client = OpenAI(api_key=api_key, base_url=base_url)

    @retry(
        stop=stop_after_attempt(3),  # retry 3 times before giving up
        wait=wait_exponential(multiplier=1, min=4, max=60),  # wait 4s, 8s, 16s between retries
        reraise=True  # reraise exception if retry fails
    )
    def chat(self, messages: List[Dict[str, str]]) -> str:
        response = self.client.chat.completions.create(
            model=self.model_name,
            messages=messages,
            temperature=self.temperature,
            timeout=self.timeout,
        )

        response = response.choices[0].message.content
        return response
    
    def chat_batch(self, messages_batch: List[List[Dict[str, str]]]) -> List[str]:
        # process in parallel
        with concurrent.futures.ThreadPoolExecutor() as executor:
            responses = list(executor.map(self.chat, messages_batch))
        return responses