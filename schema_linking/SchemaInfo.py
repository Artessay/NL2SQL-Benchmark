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
        question = database_name + '\t' + query
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
            schema = self._format_schema_description(table_name, schema_description, cursor, question=question)
            if len(schema) > 0:
                schema_list.append(schema)
        
        conn.close()
        return schema_list
    
    def _format_schema_description(self, table_name: str, schema_description: pd.DataFrame, cursor: sqlite3.Cursor, **kwargs) -> str:
        # fetch foreign key info
        table_names = self._fetch_table_names(cursor)
        _, foreign_keys_map = self._fetch_foreign_key_info(cursor, table_names)

        table_schema_str = "- Table: " + table_name + "\n"
        columns_description = self._format_columns_description(table_name, schema_description, cursor, foreign_keys_map, **kwargs)
        
        if len(columns_description) > 0:
            return table_schema_str + columns_description
        else:
            return ""
    
    def _format_columns_description(self, table_name: str, schema_description: pd.DataFrame, cursor: sqlite3.Cursor, foreign_keys_map, **kwargs) -> str:
        columns_schema_str = ""
        for _, row in schema_description.iterrows():
            columns_schema_str += self._format_column_description(row, table_name, cursor, foreign_keys_map)
        
        return columns_schema_str
    
    def _format_column_description(self, row, table_name: str, cursor: sqlite3.Cursor, foreign_keys_map) -> str:       
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

        column_schema_str = ""
        column_schema_str += f"\t- Column: {column_name}\n"
        column_schema_str += f"\t\t- Data Type: {row['data_format']}\n"

        # collect foreign key constraints 
        fully_qualified_name = f"{table_name}.{column_name}"
        referenced_column: str = foreign_keys_map.get(fully_qualified_name)
        if referenced_column is not None:
            ref_table, ref_column = referenced_column.split('.')
            column_schema_str += f"\t\t- Foreign Key: {ref_table}.{ref_column}\n"

        if column_description != 'nan':
            column_schema_str += f"\t\t- Column Description: {column_description}\n"
        column_schema_str += f"\t\t- Samples: {samples}\n"
        if value_description != 'nan' and value_description != column_description:
            column_schema_str += f"\t\t- Value Description: {value_description}\n"
        
        return column_schema_str
    

if __name__ == '__main__':
    schema_linker = SchemaInfo()

    database_dir = 'data/bird/dev_databases'
    database_names = os.listdir(database_dir)
    for database_name in database_names:
        print(database_name)
        schema_list = schema_linker.get_schema(database_dir, database_name)
        schema = "\n".join(schema_list)
    print(schema)
