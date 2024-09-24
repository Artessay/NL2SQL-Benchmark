import importlib

def load_schema_linker(schema_linking_strategy: str):
    schema_linking_module = importlib.import_module('schema_linking.' + schema_linking_strategy)
    schema_linker = getattr(schema_linking_module, schema_linking_strategy)()
    return schema_linker
    