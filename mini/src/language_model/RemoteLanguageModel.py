import os
from openai import OpenAI
from typing import Dict, List, Union

if __name__ == "__main__":
    from LanguageModel import LanguageModel
else:
    from .LanguageModel import LanguageModel

class RemoteLanguageModel(LanguageModel):
    def __init__(self, model_name, **kwargs) -> None:
        super().__init__(**kwargs)

        api_key = os.environ.get("API_KEY", "API_KEY")
        base_url = os.environ.get("API_BASE_URL", None)
        
        self.model_name = model_name
        self.max_tokens = kwargs.pop("max_tokens", 512)
        self.temperature = kwargs.pop("temperature", 0.0)
        self.stop = kwargs.pop("stop", ["--", "\n\n", ";", "#"])
        
        self.client = OpenAI(api_key=api_key, base_url=base_url)

    def chat(self, messages: Union[str, List[Dict[str, str]]]) -> str:
        messages = [
            {"role": "user", "content": messages},
        ] if isinstance(messages, str) else messages

        response = self.client.chat.completions.create(
            model=self.model_name,
            messages=messages,
            max_tokens=self.max_tokens,
            temperature=self.temperature,
            stop=self.stop,
        )

        response = response.choices[0].message.content
        return response

if __name__ == "__main__":
    model = RemoteLanguageModel("qwen-turbo")
    print(model.chat("What is the capital of France?"))