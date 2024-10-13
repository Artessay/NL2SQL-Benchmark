import os
import sqlite3
import pandas as pd


if __name__ == '__main__':
    import os, sys
    sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from schema_linking.GoldFilter import GoldFilter
from schema_linking.SchemaInfo import SchemaInfo

class GoldSchemaInfo(GoldFilter, SchemaInfo):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
    
    def _format_columns_description(self, table_name: str, schema_description: pd.DataFrame, cursor: sqlite3.Cursor, foreign_keys_map, **kwargs) -> str:
        columns_schema_str = ""

        # get selected columns
        question = kwargs.pop("question")
        selected_columns = self._get_selected_columns(None, table_name, None, question=question)
        if len(selected_columns) == 0:
            return columns_schema_str
        
        for _, row in schema_description.iterrows():
            # check if column is selected
            column_name = str(row['original_column_name']).strip()
            if column_name not in selected_columns:
                continue

            columns_schema_str += self._format_column_description(row, table_name, cursor, foreign_keys_map)
        return columns_schema_str
    

if __name__ == '__main__':
    schema_linker = GoldSchemaInfo()

    database_dir = 'data/bird/dev_databases'
    database_name = "financial"
    query = "How many accounts who have region in Prague are eligible for loans?"
    schema_list = schema_linker.get_schema(database_dir, database_name, query)
    schema = "\n".join(schema_list)
    print(schema)
