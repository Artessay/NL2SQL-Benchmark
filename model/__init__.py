from .Base import Base
# from .BasicRAG import BasicRAG

import importlib

def load_agent(method: str, args, **kwargs) -> Base:
    method_module = importlib.import_module('model.' + method)
    agent = getattr(method_module, method)(args, **kwargs)
    return agent
    
