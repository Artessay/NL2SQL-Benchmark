"""Small SQL lexical helpers shared by model-only baselines."""

from typing import Iterable


def has_quoted_function_call(sql: str, function_names: Iterable[str]) -> bool:
    """Detect a quoted SQLite function call outside literals and comments.

    SQLite accepts double-quoted, backtick-quoted, and bracket-quoted function
    identifiers, including comments between the identifier and ``(``.
    """
    names = {str(name).lower() for name in function_names}
    index = 0
    while index < len(sql):
        char = sql[index]
        next_char = sql[index + 1] if index + 1 < len(sql) else ""

        if char == "-" and next_char == "-":
            index = _skip_line_comment(sql, index + 2)
            continue
        if char == "/" and next_char == "*":
            index = _skip_block_comment(sql, index + 2)
            continue
        if char == "'":
            _, index = _read_quoted(sql, index, "'")
            continue
        if char in {'"', "`", "["}:
            closing = "]" if char == "[" else char
            identifier, index = _read_quoted(sql, index, closing)
            if identifier.lower() in names:
                following = _skip_sql_gap(sql, index)
                if following < len(sql) and sql[following] == "(":
                    return True
            continue
        index += 1
    return False


def _read_quoted(sql: str, start: int, closing: str) -> tuple[str, int]:
    index = start + 1
    content = []
    while index < len(sql):
        char = sql[index]
        if char == closing:
            if closing != "]" and index + 1 < len(sql) and sql[index + 1] == closing:
                content.append(closing)
                index += 2
                continue
            return "".join(content), index + 1
        content.append(char)
        index += 1
    return "".join(content), index


def _skip_sql_gap(sql: str, index: int) -> int:
    while index < len(sql):
        if sql[index].isspace():
            index += 1
            continue
        if sql.startswith("--", index):
            index = _skip_line_comment(sql, index + 2)
            continue
        if sql.startswith("/*", index):
            index = _skip_block_comment(sql, index + 2)
            continue
        break
    return index


def _skip_line_comment(sql: str, index: int) -> int:
    while index < len(sql) and sql[index] not in "\r\n":
        index += 1
    return index


def _skip_block_comment(sql: str, index: int) -> int:
    end = sql.find("*/", index)
    return len(sql) if end < 0 else end + 2
