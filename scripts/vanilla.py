
import chardet
import sqlite3


def get_table_schema(db_path):
    # connect to the database
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute("SELECT sql FROM sqlite_master WHERE type='table';")
    schema_statements = cursor.fetchall()
    conn.close()

    schema = "\n\n".join(statement[0] for statement in schema_statements if statement[0] is not None)
    return schema

def get_table_schema_with_insert_data(db_path):
    with open(db_path, 'r', encoding='utf-8') as f:
        schema = f.read()
    return schema

def get_dump_schema(db_path):
    # connect to the database
    conn = sqlite3.connect(db_path)
    schema = "\n".join(conn.iterdump())
    return schema