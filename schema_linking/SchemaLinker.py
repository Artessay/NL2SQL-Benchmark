import os
import sqlite3
from typing import Dict, List

from abc import abstractmethod

"""
This is the interface class for schema linking.
"""
class SchemaLinker():
    def __init__(self, **kwargs) -> None:
        self.num_insert_rows = kwargs.pop("num_insert_rows", 5)
        assert self.num_insert_rows >= 0

    def get_schema(
            self, 
            database_dir: str, 
            database_name: str,
            query: str, 
            evidence: str = None,
    ) -> List[str]:
        # prepare question
        question = database_name + '\t' + query
        query = query + ' ' + evidence if evidence else query

        # connect to db
        db_path = os.path.join(database_dir, database_name, f'{database_name}.sqlite')
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()

        # fetch all table names
        table_names = self._fetch_table_names(cursor)

        # fetch all table_info
        table_info = self._fetch_table_info(cursor, table_names)

        # fetch foreign key info
        foreign_keys_set, foreign_keys_map = self._fetch_foreign_key_info(cursor, table_names)

        schema_list = []
        for table_name in table_names:
            columns_info = table_info[table_name]
            
            # get selected columns
            selected_columns = self._get_selected_columns(query, table_name, columns_info, foreign_keys_set=foreign_keys_set, question=question)
            if len(selected_columns) == 0:
                continue

            # prepare create table statement and insert statements
            create_statement = self._construct_create_table_statement(table_name, columns_info, selected_columns, foreign_keys_map)
            insert_statements = self._construct_insert_statements(cursor, table_name, selected_columns)
            schema_list.append(create_statement + "\n" + insert_statements)

        conn.close()

        return schema_list
    
    @abstractmethod
    def _get_selected_columns(self, query: str, table_name: str, columns_info: List, **kwargs) -> List[str]:
        raise NotImplementedError()

    def _construct_create_table_statement(self, table_name: str, columns_info: List[List[str]], selected_columns: List[str], foreign_keys_map) -> str:
        if len(selected_columns) == 0:
            return ""
        
        create_statement = f"CREATE TABLE `{table_name}` \n(\n"
        foreign_keys_contrains = ""
        
        for column_info in columns_info:
            column_name = column_info[1]
            column_type = column_info[2]
            column_notnull = column_info[3]
            column_default_value = column_info[4]
            column_pk = column_info[5]
            fully_qualified_name = f"{table_name}.{column_name}"
            
            # Check if the column is a primary key or foreign key
            if column_name in selected_columns:                
                create_statement += f"\t`{column_name}`\t{column_type}"
                if column_notnull:
                    create_statement += "\tNOT NULL"
                else:
                    create_statement += "\tNULL"
                if column_default_value is not None:
                    create_statement += f"\tDEFAULT {column_default_value}"
                if column_pk:
                    create_statement += "\tPRIMARY KEY"
                create_statement += ",\n"

                # collect foreign key constraints 
                referenced_column: str = foreign_keys_map.get(fully_qualified_name)
                if referenced_column is not None:
                    ref_table, ref_column = referenced_column.split('.')
                    foreign_keys_contrains += f"\tforeign key (`{column_name}`) references `{ref_table}` (`{ref_column}`),\n"
        
        # Add foreign key constraints
        create_statement += foreign_keys_contrains
        
        create_statement = create_statement.rstrip(",\n") + "\n);\n"
        return create_statement

    def _construct_insert_statements(self, cursor: sqlite3.Cursor, table_name: str, column_names: List[str]) -> str:
        """
        Construct insert statements for each row in the table.
        """
        if len(column_names) == 0:
            return ""
        
        insert_statements = ""
        column_names_str = ", ".join([f"`{column_name}`" for column_name in column_names])

        # Get the first few rows of the current table for example insert statements
        cursor.execute(f"SELECT {column_names_str} FROM `{table_name}` LIMIT {self.num_insert_rows};")
        rows = cursor.fetchall()

        if rows:
            # Create INSERT statements for the sample data
            for row in rows:
                # Properly format the INSERT statement with the actual row values
                row_values = ', '.join([self._format_sql_value(value) for value in row])
                insert_statements += f"INSERT INTO `{table_name}` VALUES ({row_values});\n"
                # insert_statements += f"INSERT INTO `{table_name}` ({column_names_str}) VALUES ({row_values});\n"

        return insert_statements
    
    def _fetch_table_names(self, cursor: sqlite3.Cursor) -> List[str]:
        """
        Fetch all table names from the database.
        """
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        return [row[0] for row in cursor.fetchall()]
    
    def _fetch_table_info(self, cursor: sqlite3.Cursor, table_names: List[str]) -> Dict[str, List[List[str]]]:
        """
        Fetch all table information (column names and types) from the database.
        """
        table_info = {}
        for table_name in table_names:
            cursor.execute(f"PRAGMA table_info(`{table_name}`)")
            table_info[table_name] = [row for row in cursor.fetchall()]
        return table_info

    def _fetch_foreign_key_info(self, cursor: sqlite3.Cursor, table_names: List[str]):
        # fetch foreign keys
        foreign_keys_set = set()
        foreign_keys_map = dict()
        for table_name in table_names:
            cursor.execute(f"PRAGMA foreign_key_list(`{table_name}`)")
            fks = cursor.fetchall()
            for fk in fks:
                referenced_column = f"{fk[2]}.{fk[4]}"
                referencing_column = f"{table_name}.{fk[3]}"
                foreign_keys_set.add(referenced_column)
                foreign_keys_set.add(referencing_column)
                foreign_keys_map[referencing_column] = referenced_column
        return foreign_keys_set, foreign_keys_map

    def _format_sql_value(self, value) -> str:
        if value is None:
            return "NULL"
        elif isinstance(value, str):
            value = value.replace("'", "''")
            return f"'{value}'"
        else:
            return str(value)
