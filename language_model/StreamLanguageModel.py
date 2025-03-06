import os

from openai import OpenAI
from typing import Dict, List

if __name__ == "__main__":
    from LanguageModel import LanguageModel
else:
    from .LanguageModel import LanguageModel

class StreamLanguageModel(LanguageModel):
    def __init__(self, model_name, **kwargs) -> None:
        super().__init__(**kwargs)

        api_key = os.environ.get("OPENAI_API_KEY", None)
        base_url = os.environ.get("OPENAI_API_BASE_URL", None)
        
        self.model_name = model_name
        self.temperature = kwargs.pop("temperature", 0.0)
        self.timeout = kwargs.pop("timeout", 60)
        self.client = OpenAI(
            api_key=api_key, 
            base_url=base_url
        )

    def chat(self, messages: List[Dict[str, str]]) -> str:
        reasoning_content = ""  # 定义完整思考过程
        answer_content = ""     # 定义完整回复
        is_answering = False   # 判断是否结束思考过程并开始回复

        # 创建聊天完成请求
        completion = self.client.chat.completions.create(
            model=self.model_name,
            messages=messages,
            stream=True,
            stream_options={
                "include_usage": True # 在最后一个chunk返回Token使用量
            }
        )

        # print("\n" + "=" * 20 + "思考过程" + "=" * 20 + "\n")

        for chunk in completion:
            # 如果chunk.choices为空，则打印usage
            if not chunk.choices:
                # print("\nUsage:")
                # print(chunk.usage)
                pass
            else:
                delta = chunk.choices[0].delta
                # 打印思考过程
                if hasattr(delta, 'reasoning_content') and delta.reasoning_content != None:
                    # print(delta.reasoning_content, end='', flush=True)
                    reasoning_content += delta.reasoning_content
                else:
                    # 开始回复
                    if delta.content != "" and is_answering is False:
                        # print("\n" + "=" * 20 + "完整回复" + "=" * 20 + "\n")
                        is_answering = True
                    # 打印回复过程
                    # print(delta.content, end='', flush=True)
                    answer_content += delta.content
        
        # print("\n" + "=" * 20 + "回复结束" + "=" * 20 + "\n")
        return answer_content

if __name__ == "__main__":
    # model = StreamLanguageModel("qwq-32b")
    model = StreamLanguageModel("qwq-plus")
    print(model.generate("What is the capital of France?"))