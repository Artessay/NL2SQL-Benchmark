import json
from .SchemaLinker import SchemaLinker

from typing import List

class GoldFilter(SchemaLinker):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        gold_schema_path = kwargs.pop(
            "gold_schema_path", 
            "data/bird/dev_gold_schema.json"
        )
        with open(gold_schema_path, "r") as f:
            self.gold_schema = json.load(f)
    
    def _get_selected_columns(self, query: str, table_name: str, columns_info: List, **kwargs) -> List[str]:
        question = kwargs.pop("question")
        return self.gold_schema[question].get(table_name, [])