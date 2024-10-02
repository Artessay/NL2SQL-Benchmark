from .LocalLanguageModel import LocalLanguageModel
from .RemoteLanguageModel import RemoteLanguageModel

def load_language_model(model_name: str, **kwargs):
    if model_name in ["Qwen/Qwen2-72B-Instruct", "Qwen/Qwen2.5-72B-Instruct"]:
        return RemoteLanguageModel("qwen2:72b", **kwargs)
    else:
        return LocalLanguageModel(model_name, **kwargs)