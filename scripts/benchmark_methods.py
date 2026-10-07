"""Resumable BIRD execution-accuracy benchmark for the repository's methods.

Gold SQL is used only by the evaluator, after the method has returned its SQL.
Predictions and intermediate queries run on read-only SQLite connections.
"""

import argparse
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
import hashlib
import importlib.metadata
import json
import logging
from pathlib import Path
import sqlite3
import sys
import threading
import time
from types import SimpleNamespace

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT))

from langchain_core.callbacks import BaseCallbackHandler

from model import load_agent
from schema_linking.VanillaLinker import VanillaLinker
from tools.SqlExecutor import SqlExecutor
from utils import remove_sql_comments

METHODS = [
    "Base", "CoTVerifier", "CoVe", "DACCorrection", "CHESSUnitTester",
    "DINSQLCorrection", "SelfDebugging", "MCSSelector", "SQLPromptMix",
]
LOCAL = threading.local()


def write_json(path, value):
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(json.dumps(value, ensure_ascii=False, indent=2) + "\n")
    temporary.replace(path)


class ReadOnlyExecutor(SqlExecutor):
    def __init__(self, database_dir, database_name, timeout=30):
        super().__init__(str(database_dir), database_name, dataset_name="bird")
        self.timeout = timeout

    def execute_sql(self, sql):
        started = time.monotonic()
        uri = Path(self.database_path).resolve().as_uri() + "?mode=ro"
        connection = sqlite3.connect(uri, uri=True, timeout=self.timeout)
        try:
            connection.execute("PRAGMA query_only=ON")
            # SQLite's authorizer allows scalar functions such as REPLACE,
            # whose name must not be mistaken for a write statement in gold SQL.
            def authorize(action, arg1, arg2, database, trigger):
                if action == sqlite3.SQLITE_FUNCTION and str(arg2).lower() in {
                    "load_extension", "writefile",
                }:
                    return sqlite3.SQLITE_DENY
                allowed = {sqlite3.SQLITE_SELECT, sqlite3.SQLITE_READ,
                           sqlite3.SQLITE_FUNCTION, sqlite3.SQLITE_RECURSIVE}
                return sqlite3.SQLITE_OK if action in allowed else sqlite3.SQLITE_DENY

            connection.set_authorizer(authorize)
            connection.set_progress_handler(
                lambda: int(time.monotonic() - started > self.timeout), 10000
            )
            cursor = connection.execute(sql)
            if cursor.description is None:
                return {"sqlite_error": "SQL returned no result columns"}
            return {"data": cursor.fetchall()}
        except sqlite3.Error as error:
            return {"sqlite_error": str(error)}
        finally:
            connection.close()


class Trace(BaseCallbackHandler):
    def __init__(self):
        self.calls = []
        self.lock = threading.Lock()

    def on_llm_end(self, response, **kwargs):
        for batch in response.generations:
            for generation in batch:
                message = generation.message
                event = {
                    "content": message.content,
                    "usage": message.usage_metadata or {},
                    "finish_reason": message.response_metadata.get("finish_reason"),
                }
                with self.lock:
                    self.calls.append(event)

    def on_llm_error(self, error, **kwargs):
        with self.lock:
            self.calls.append({"error": str(error)})


class CaseLogs(logging.Handler):
    def emit(self, record):
        records = getattr(LOCAL, "logs", None)
        if records is not None:
            records.append({"level": record.levelname, "module": record.name,
                            "message": record.getMessage()})


def run_case(method, index, item, schema, args):
    LOCAL.logs = []
    if not hasattr(LOCAL, "agents"):
        LOCAL.agents = {}
    if method not in LOCAL.agents:
        agent = load_agent(method, SimpleNamespace(language_model=args.model),
                           base_url=args.base_url, api_key="EMPTY",
                           temperature=0, timeout=args.request_timeout,
                           max_new_tokens=args.max_tokens,
                           extra_body={"chat_template_kwargs": {"enable_thinking": False}})
        trace = Trace()
        agent.model.client = agent.model.client.with_config(
            callbacks=[trace], max_concurrency=args.batch_concurrency
        )
        LOCAL.agents[method] = agent, trace
    agent, trace = LOCAL.agents[method]
    trace.calls = []
    executor = ReadOnlyExecutor(args.database_root, item["db_id"], args.sql_timeout)
    agent.sql_executor = executor
    started = time.monotonic()
    error = None
    try:
        sql = agent(schema, item["question"], item.get("evidence"))
        sql = remove_sql_comments(sql).replace("\n", " ").strip() or ";"
    except Exception as exc:
        sql, error = ";", repr(exc)
    generation_seconds = time.monotonic() - started
    evaluation_started = time.monotonic()
    predicted = executor.execute_sql(sql)
    gold = executor.execute_sql(item["SQL"])
    executable = "data" in predicted
    gold_ok = "data" in gold
    # Same set-of-rows semantics as evaluation/evaluation_bird_ex.py.
    correct = executable and gold_ok and set(predicted["data"]) == set(gold["data"])
    calls = list(trace.calls)
    return {
        "method": method, "index": index, "question_id": item.get("question_id", index),
        "db_id": item["db_id"], "difficulty": item["difficulty"],
        "question": item["question"], "prediction": sql, "gold": item["SQL"],
        "correct": bool(correct), "executable": executable,
        "prediction_error": predicted.get("sqlite_error"), "gold_error": gold.get("sqlite_error"),
        "pipeline_error": error, "generation_seconds": generation_seconds,
        "evaluation_seconds": time.monotonic() - evaluation_started,
        "llm_calls": len(calls),
        "input_tokens": sum(c.get("usage", {}).get("input_tokens", 0) for c in calls),
        "output_tokens": sum(c.get("usage", {}).get("output_tokens", 0) for c in calls),
        "truncated_calls": sum(c.get("finish_reason") == "length" for c in calls),
        "llm_errors": sum("error" in c for c in calls),
        "logs": LOCAL.logs, "calls": calls,
    }


def summarize(records, methods, expected):
    summary = {}
    for method in methods:
        rows = [r for r in records if r["method"] == method]
        count = len(rows)
        if not count:
            continue
        latencies = sorted(r["generation_seconds"] for r in rows)
        summary[method] = {
            "completed": count, "expected": expected,
            "correct": sum(r["correct"] for r in rows),
            "ex_percent": 100 * sum(r["correct"] for r in rows) / count,
            "executable_percent": 100 * sum(r["executable"] for r in rows) / count,
            "mean_seconds": sum(latencies) / count,
            "p95_seconds": latencies[min(count - 1, int(count * .95))],
            "mean_llm_calls": sum(r["llm_calls"] for r in rows) / count,
            "input_tokens": sum(r["input_tokens"] for r in rows),
            "output_tokens": sum(r["output_tokens"] for r in rows),
            "truncated_calls": sum(r["truncated_calls"] for r in rows),
            "llm_errors": sum(r["llm_errors"] for r in rows),
            "gold_errors": sum(r["gold_error"] is not None for r in rows),
            "pipeline_errors": sum(r["pipeline_error"] is not None for r in rows),
            "cases_with_warnings": sum(any(log["level"] in ("WARNING", "ERROR", "CRITICAL")
                                           for log in r["logs"]) for r in rows),
            "difficulty": {
                difficulty: {
                    "count": len(group := [r for r in rows if r["difficulty"] == difficulty]),
                    "correct": sum(r["correct"] for r in group),
                    "ex_percent": 100 * sum(r["correct"] for r in group) / len(group) if group else None,
                } for difficulty in ("simple", "moderate", "challenging")
            },
        }
    return summary


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--database-root", type=Path, required=True)
    parser.add_argument("--data", type=Path, default=ROOT / "data/bird/dev.json")
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--methods", nargs="+", choices=METHODS, default=METHODS)
    parser.add_argument("--model", default="Qwen/Qwen3.8-27B")
    parser.add_argument("--base-url", default="http://127.0.0.1:8930/v1")
    parser.add_argument("--workers", type=int, default=8)
    parser.add_argument("--batch-concurrency", type=int, default=2)
    parser.add_argument("--max-tokens", type=int, default=4096)
    parser.add_argument("--request-timeout", type=float, default=180)
    parser.add_argument("--sql-timeout", type=float, default=30)
    parser.add_argument("--indices", nargs="+", type=int)
    args = parser.parse_args()
    data = json.loads(args.data.read_text())
    indices = args.indices if args.indices is not None else list(range(len(data)))
    if len(set(indices)) != len(indices) or any(i < 0 or i >= len(data) for i in indices):
        parser.error("indices must be distinct, valid dataset indices")
    if min(args.workers, args.batch_concurrency, args.max_tokens) < 1:
        parser.error("workers, batch-concurrency and max-tokens must be positive")
    for db in {data[i]["db_id"] for i in indices}:
        if not (args.database_root / db / (db + ".sqlite")).is_file():
            parser.error(f"Missing database: {db}")
    args.output.mkdir(parents=True, exist_ok=True)
    manifest = {
        "dataset_sha256": hashlib.sha256(args.data.read_bytes()).hexdigest(),
        "database_root": str(args.database_root.resolve()), "indices": indices,
        "databases": {
            db: {"size": (stat := (args.database_root / db / (db + ".sqlite")).stat()).st_size,
                 "mtime_ns": stat.st_mtime_ns}
            for db in sorted({data[i]["db_id"] for i in indices})
        },
        "methods": args.methods, "model": args.model, "base_url": args.base_url,
        "temperature": 0, "enable_thinking": False, "max_tokens": args.max_tokens,
        "request_timeout": args.request_timeout, "sql_timeout": args.sql_timeout,
        "schema_linker": "VanillaLinker", "schema_sample_rows": 5,
        "metric": "BIRD EX: equality of full result sets; row order and duplicates ignored",
        "code_sha256": {str(p.relative_to(ROOT)): hashlib.sha256(p.read_bytes()).hexdigest()
                        for folder in ("model", "language_model", "schema_linking", "tools")
                        for p in sorted((ROOT / folder).glob("*.py"))},
        "runner_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "python": sys.executable,
        "packages": {p: importlib.metadata.version(p) for p in ("langchain-openai", "openai", "json5")},
    }
    manifest_path = args.output / "manifest.json"
    if manifest_path.exists() and json.loads(manifest_path.read_text()) != manifest:
        parser.error("Output manifest differs; use a new output directory")
    write_json(manifest_path, manifest)
    logging.getLogger().handlers.clear()
    logging.getLogger().addHandler(CaseLogs())
    logging.getLogger().setLevel(logging.INFO)
    logging.getLogger("httpx").setLevel(logging.WARNING)
    logging.getLogger("httpcore").setLevel(logging.WARNING)
    linker = VanillaLinker()
    schemas = {db: linker.get_schema(str(args.database_root), db, "")
               for db in sorted({data[i]["db_id"] for i in indices})}
    write_json(args.output / "schemas.json", schemas)
    records, pending = [], []
    for method in args.methods:
        (args.output / method).mkdir(exist_ok=True)
    # Interleave methods so interim results cover every method on identical questions.
    for index in indices:
        for method in args.methods:
            path = args.output / method / f"{index:04d}.json"
            if path.exists():
                record = json.loads(path.read_text())
                record.pop("calls", None)
                records.append(record)
            else:
                pending.append((method, index, path))
    started = time.monotonic()
    print(f"Starting {len(pending)} cases; {len(records)} resumed; {args.workers} workers", flush=True)
    with ThreadPoolExecutor(max_workers=args.workers) as pool:
        futures = {
            pool.submit(run_case, method, index, data[index], schemas[data[index]["db_id"]], args): path
            for method, index, path in pending
        }
        for future in as_completed(futures):
            path = futures[future]
            record = future.result()
            write_json(path, record)
            record.pop("calls", None)
            records.append(record)
            print(f"{len(records)}/{len(indices)*len(args.methods)} {record['method']} "
                  f"index={record['index']} EX={int(record['correct'])} "
                  f"calls={record['llm_calls']} seconds={record['generation_seconds']:.1f}", flush=True)
            if len(records) % 20 == 0:
                write_json(args.output / "summary.json", summarize(records, args.methods, len(indices)))
                write_json(args.output / "progress.json", {
                    "updated_at": datetime.now(timezone.utc).isoformat(),
                    "completed": len(records), "expected": len(indices)*len(args.methods),
                    "session_elapsed_seconds": time.monotonic() - started,
                })
    summary = summarize(records, args.methods, len(indices))
    write_json(args.output / "summary.json", summary)
    for method in args.methods:
        rows = sorted((r for r in records if r["method"] == method), key=lambda r: r["index"])
        (args.output / method / "dev_pred.sql").write_text("".join(r["prediction"] + "\n" for r in rows))
        (args.output / method / "dev_pred_gt.sql").write_text(
            "".join(r["prediction"] + "\t" + r["db_id"] + "\n" for r in rows))
    write_json(args.output / "progress.json", {
        "updated_at": datetime.now(timezone.utc).isoformat(), "complete": True,
        "completed": len(records), "expected": len(indices)*len(args.methods),
        "session_elapsed_seconds": time.monotonic() - started,
    })
    print(json.dumps(summary, ensure_ascii=False, indent=2), flush=True)


if __name__ == "__main__":
    main()
