from typing import List

if __name__ == '__main__':
    import os, sys
    sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from schema_linking import SchemaLinker

class VanillaLinker(SchemaLinker):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
    
    def _get_selected_columns(self, query: str, table_name: str, columns_info: List, **kwargs) -> List[str]:
        column_names = [column_info[1] for column_info in columns_info]
        return column_names

if __name__ == '__main__':
    schema_linker = VanillaLinker()

    database_dir = 'data/bird/dev_databases'
    database_names = ["debit_card_specializing"] # os.listdir(database_dir)
    for database_name in database_names:
        print(database_name)
        schema_list = schema_linker.get_schema(database_dir, database_name, "")
        schema = "\n".join(schema_list)

    print(schema)
