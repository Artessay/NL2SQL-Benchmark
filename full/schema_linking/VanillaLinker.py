from .SchemaLinker import SchemaLinker

from typing import List

class VanillaLinker(SchemaLinker):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
    
    def _get_selected_columns(self, query: str, table_name: str, columns_info: List, **kwargs) -> List[str]:
        column_names = [column_info[1] for column_info in columns_info]
        return column_names