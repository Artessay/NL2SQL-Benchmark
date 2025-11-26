from .LocalLanguageModel import LocalLanguageModel
from .RemoteLanguageModel import RemoteLanguageModel
from .StreamLanguageModel import StreamLanguageModel

model_name_dict = {
    "Qwen/plus": "qwen-plus",
    "Qwen/QwQ-32B": "qwq-32b",
    "Qwen/QwQ-plus": "qwq-plus",
    "Qwen/Qwen2.5-72B-Instruct": "qwen2.5:72b",

    "DeepSeek/DeepSeek-R1-32B": "deepseek-r1:32b",
    "DeepSeek/DeepSeek-R1-70B": "deepseek-r1:70b", # "deepseek-r1-distill-llama-70b", 
    "DeepSeek/DeepSeek-R1": "deepseek-r1-local-preview", 
    
    "openai/gpt-4o": "gpt-4o-2024-11-20",
}

def load_language_model(model_name: str, **kwargs):
    if model_name in model_name_dict.keys():
        if "QwQ" in model_name:
            return StreamLanguageModel(model_name_dict[model_name], **kwargs)
        else:
            return RemoteLanguageModel(model_name_dict[model_name], **kwargs)
    else:
        return LocalLanguageModel(model_name, **kwargs)