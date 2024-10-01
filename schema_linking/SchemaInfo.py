import os
import sqlite3
import pandas as pd

from typing import List, Optional

if __name__ == '__main__':
    from SchemaLinker import SchemaLinker
else:
    from .SchemaLinker import SchemaLinker

class SchemaInfo(SchemaLinker):
    def __init__(self, **kwargs) -> None:
        pass

    def get_schema(
            self, 
            database_dir: str, 
            database_name: str,
            query: Optional[str] = None, 
            evidence: Optional[str] = None,
    ) -> List[str]:
        database_description_dir = os.path.join(database_dir, database_name, 'database_description')
        
        # check each file is ending with .csv
        schema_description_files = os.listdir(database_description_dir)
        schema_description_files = [file for file in schema_description_files if file.endswith('.csv')]

        # connect to db
        db_path = os.path.join(database_dir, database_name, f'{database_name}.sqlite')
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()

        schema_list = []
        for schema_description_file in schema_description_files:
            schema_description = pd.read_csv(os.path.join(database_description_dir, schema_description_file))
            table_name = schema_description_file.split('.')[0]
            schema = self._format_schema_description(table_name, schema_description, cursor)
            schema_list.append(schema)
        
        conn.close()
        return schema_list
    
    def _format_schema_description(self, table_name: str, schema_description: pd.DataFrame, cursor: sqlite3.Cursor) -> str:
        table_schema_str = "- Table: " + table_name + "\n"
        for _, row in schema_description.iterrows():
            # basic information
            column_name = row['column_name'] if not pd.isnull(row['column_name']) else row['original_column_name']
            data_format = row['data_format']
            column_description = row['value_description'] if not pd.isnull(row['value_description']) else row['column_description']
            column_description = str(column_description).replace('\n', ' ')



            table_schema_str += f"  - Column: {column_name}\n"
            table_schema_str += f"    - Data Type: {data_format}\n"
            table_schema_str += f"    - Description: {column_description}\n"
            # table_schema_str += f"    - Examples: " + row['examples'] + "\n"
        
        return table_schema_str

if __name__ == '__main__':
    schema_info = SchemaInfo()
    schema_list = schema_info.get_schema('data/bird/dev_databases', 'california_schools')
    schema = "\n".join(schema_list)
    print(schema)

