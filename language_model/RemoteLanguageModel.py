import os

from typing import Dict, List
from langchain_openai import ChatOpenAI
from tenacity import retry, stop_after_attempt, wait_exponential

if __name__ == "__main__":
    from LanguageModel import LanguageModel
else:
    from .LanguageModel import LanguageModel

class RemoteLanguageModel(LanguageModel):
    def __init__(self, model_name, **kwargs) -> None:
        super().__init__(**kwargs)

        api_key = os.environ.get("OPENAI_API_KEY", None)
        base_url = os.environ.get("OPENAI_API_BASE_URL", None)
        
        self.temperature = kwargs.pop("temperature", 0.0)
        self.timeout = kwargs.pop("timeout", 60)
        self.client = ChatOpenAI(
            model=model_name,
            api_key=api_key, 
            base_url=base_url
        )

    @retry(
        stop=stop_after_attempt(3),  # retry 3 times before giving up
        wait=wait_exponential(multiplier=1, min=4, max=60),  # wait 4s, 8s, 16s between retries
        reraise=True  # reraise exception if retry fails
    )
    def chat(self, messages: List[Dict[str, str]]) -> str:
        response = self.client.invoke(
            input=messages
        )
        return response.content
    
    def chat_batch(self, messages_batch: List[List[Dict[str, str]]]) -> List[str]:
        # process in parallel
        responses = self.client.batch(messages_batch)
        return [response.content for response in responses]
    
if __name__ == "__main__":
    # model = RemoteLanguageModel("qwen-turbo")
    model = RemoteLanguageModel("deepseek-r1-distill-llama-70b")
    print(model.generate("What is the capital of France?"))
    print(model.generate(["What is the capital of France?", "What is the capital of Germany?"]))