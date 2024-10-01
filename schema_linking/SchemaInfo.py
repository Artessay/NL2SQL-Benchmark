import os
import chardet
import sqlite3
import pandas as pd

from typing import List, Optional

if __name__ == '__main__':
    import os, sys
    sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from schema_linking import SchemaLinker

class SchemaInfo(SchemaLinker):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)

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
            csv_file_path = os.path.join(database_description_dir, schema_description_file)
            
            # detect encoding
            with open(csv_file_path, 'rb') as file:
                result = chardet.detect(file.read())
                encoding = result['encoding']
            
            # read schema description
            schema_description = pd.read_csv(csv_file_path, encoding=encoding)
            table_name = schema_description_file.split('.')[0]
            schema = self._format_schema_description(table_name, schema_description, cursor)
            schema_list.append(schema)
        
        conn.close()
        return schema_list
    
    def _format_schema_description(self, table_name: str, schema_description: pd.DataFrame, cursor: sqlite3.Cursor) -> str:
        table_schema_str = "- Table: " + table_name + "\n"
        for _, row in schema_description.iterrows():
            # basic information
            column_name = str(row['original_column_name']).strip()
            column_description = row['column_description'] if not pd.isnull(row['column_description']) else row['column_name']
            column_description = str(column_description).replace('\n', ' ')
            value_description = str(row['value_description'])
            if '\n' in value_description:
                value_description = '\n' + '\n'.join(['\t\t\t' + line for line in value_description.splitlines()])

            # Get the first few rows of the current table for example insert statements
            cursor.execute(f"SELECT DISTINCT `{column_name}` FROM `{table_name}` LIMIT {self.num_insert_rows};")
            sample_rows = cursor.fetchall()
            samples = [str(sample_row[0]) for sample_row in sample_rows]

            table_schema_str += f"\t- Column: {column_name}\n"
            table_schema_str += f"\t\t- Data Type: {row['data_format']}\n"
            if column_description != 'nan':
                table_schema_str += f"\t\t- Column Description: {column_description}\n"
            table_schema_str += f"\t\t- Samples: {samples}\n"
            if value_description != 'nan' and value_description != column_description:
                table_schema_str += f"\t\t- Value Description: {value_description}\n"
        
        return table_schema_str

if __name__ == '__main__':
    schema_linker = SchemaInfo()

    database_dir = 'data/bird/dev_databases'
    database_names = os.listdir(database_dir)
    for database_name in database_names:
        print(database_name)
        schema_list = schema_linker.get_schema(database_dir, database_name)
        schema = "\n".join(schema_list)
    print(schema)
