from .LocalLanguageModel import LocalLanguageModel
from .RemoteLanguageModel import RemoteLanguageModel

def load_language_model(model_name: str):
    if model_name in ["Qwen/Qwen2-72B-Instruct"]:
        return RemoteLanguageModel(model_name)
    else:
        return LocalLanguageModel(model_name)