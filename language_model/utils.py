from .LocalLanguageModel import LocalLanguageModel
from .RemoteLanguageModel import RemoteLanguageModel

model_name_dict = {
    "Qwen/Qwen2.5-72B-Instruct": "qwen2.5:72b",
    "DeepSeek/DeepSeek-R1-32B": "deepseek-r1:32b",
    "DeepSeek/DeepSeek-R1-70B": "deepseek-r1:70b", # "deepseek-r1-distill-llama-70b", 
    "DeepSeek/DeepSeek-Coder-V2-16B": "deepseek-coder-v2",  
}

def load_language_model(model_name: str, **kwargs):
    if model_name in model_name_dict.keys():
        return RemoteLanguageModel(model_name_dict[model_name], **kwargs)
    else:
        return LocalLanguageModel(model_name, **kwargs)