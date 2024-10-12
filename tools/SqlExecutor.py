import os
import sqlite3
from func_timeout import func_set_timeout


class SqlExecutor:
    def __init__(self, database_dir: str, database_name: str) -> None:
        self.database_path = os.path.join(database_dir, database_name, f'{database_name}.sqlite')

    @func_set_timeout(120)
    def execute_sql(self, sql: str) -> dict:
        # Get database connection
        conn = sqlite3.connect(self.database_path)
        conn.text_factory = lambda b: b.decode(errors="ignore")
        cursor = conn.cursor()
        try:
            cursor.execute(sql)
            result = cursor.fetchall()
            return {
                "sql": str(sql),
                "data": result,
            }
        except sqlite3.Error as er:
            return {
                "sql": str(sql),
                "sqlite_error": str(' '.join(er.args)),
                "exception_class": str(er.__class__)
            }
        except Exception as e:
            return {
                "sql": str(sql),
                "sqlite_error": str(e.args),
                "exception_class": str(type(e).__name__)
            }

    def is_need_refine(self, exec_result: dict):
        # spider exist dirty values, even gold sql execution result is None
        if self.dataset_name == 'spider':
            if 'data' not in exec_result:
                return True
            return False
        
        data = exec_result.get('data', None)
        if data is not None:
            if len(data) == 0:
                exec_result['sqlite_error'] = 'no data selected'
                return True
            for t in data:
                for n in t:
                     if n is None:  # fixme fixme fixme fixme fixme
                        exec_result['sqlite_error'] = 'exist None value, you can add `NOT NULL` in SQL'
                        return True
            return False
        else:
            return True