import os
import sqlite3
from utils import (
    get_args,
    load_dataset,
)

args = get_args()
dataset = load_dataset(args.data_path)

for item in dataset:
    db = item['db_id']
    sqlite_path = os.path.join(args.database_path, db, f'{db}.sqlite')

    # Replace 'your-database-file.db' with the path to your actual database file
    conn = sqlite3.connect(sqlite_path)
    cursor = conn.cursor()

    try:
        cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = cursor.fetchall()

        # your other code ...

    except sqlite3.OperationalError as e:
        print(f"[{db}] An error occurred: {e}")
        # Here, handle the error or re-raise it depending on your needs

    finally:
        cursor.close()
        conn.close()
