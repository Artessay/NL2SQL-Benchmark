"""Export completed BIRD runs to the repository's conventional result paths.

This reads saved predictions and evaluations; it makes no model or SQL requests.
"""

import argparse
import hashlib
import json
from pathlib import Path
import re


ROOT = Path(__file__).resolve().parents[1]


def json_text(value):
    return json.dumps(value, ensure_ascii=False, indent=2) + "\n"


def component(value):
    if not isinstance(value, str) or value in {"", ".", ".."} or "/" in value or "\\" in value:
        raise ValueError(f"Invalid result path component: {value!r}")
    return value


def export_results(run_dir, data_path, output_root):
    run_dir, data_path, output_root = map(Path, (run_dir, data_path, output_root))
    manifest = json.loads((run_dir / "manifest.json").read_text(encoding="utf-8"))
    progress = json.loads((run_dir / "progress.json").read_text(encoding="utf-8"))
    summaries = json.loads((run_dir / "summary.json").read_text(encoding="utf-8"))
    dataset_bytes = data_path.read_bytes()
    if hashlib.sha256(dataset_bytes).hexdigest() != manifest["dataset_sha256"]:
        raise ValueError("Dataset does not match the completed run")
    dataset = json.loads(dataset_bytes)
    expected = list(range(len(dataset)))
    if not progress.get("complete") or sorted(manifest["indices"]) != expected:
        raise ValueError("Only completed full BIRD dev runs can be exported")
    methods = [component(method) for method in manifest["methods"]]
    if not methods or len(set(methods)) != len(methods):
        raise ValueError("Run methods must be nonempty and distinct")
    if progress["completed"] != len(dataset) * len(methods):
        raise ValueError("Completed case count does not match the run manifest")
    model_parts = manifest["model"].split("/")
    if len(model_parts) != 2:
        raise ValueError("Expected a model name in vendor/model format")
    vendor, model = map(component, model_parts)
    linker = component(manifest["schema_linker"])
    outputs = {}
    destinations = []
    for method in methods:
        records = []
        for index, item in enumerate(dataset):
            record = json.loads((run_dir / method / f"{index:04d}.json").read_text(encoding="utf-8"))
            if (record["method"] != method or record["index"] != index
                    or record["db_id"] != item["db_id"] or record["gold"] != item["SQL"]
                    or record["question"] != item["question"]
                    or record["question_id"] != item.get("question_id", index)):
                raise ValueError(f"Record does not match dataset: {method}/{index:04d}")
            if any(char in record["prediction"] for char in "\r\n"):
                raise ValueError(f"Prediction is not one line: {method}/{index:04d}")
            records.append(record)
        stats = summaries[method]
        correct = sum(record["correct"] for record in records)
        if (stats["completed"] != len(dataset) or stats["expected"] != len(dataset)
                or stats["correct"] != correct
                or abs(stats["ex_percent"] - 100 * correct / len(dataset)) > 1e-9):
            raise ValueError(f"Summary does not match saved evaluations: {method}")
        predictions = [record["prediction"] for record in records]
        eval_rows = []
        for item, record in zip(dataset, records):
            # Match evaluation/evaluation_bird_ex.py's existing JSON format.
            row = {key: value for key, value in item.items() if key != "SQL"}
            row.update(pred=re.sub(r"\s+", " ", record["prediction"]),
                       gold=re.sub(r"\s+", " ", record["gold"]),
                       res=int(record["correct"]))
            eval_rows.append(row)
        summary = {
            "dataset": "bird", "split": "dev", "method": method,
            "language_model": manifest["model"], "schema_linker": linker,
            **stats,
            "configuration": {key: manifest[key] for key in (
                "temperature", "enable_thinking", "max_tokens", "request_timeout",
                "sql_timeout", "schema_sample_rows",
            )},
            "metric": manifest["metric"], "ves": None,
            "provenance": {
                "run_id": run_dir.name, "completed_at": progress["updated_at"],
                "dataset_sha256": manifest["dataset_sha256"],
                "code_sha256": manifest["code_sha256"],
                "runner_sha256": manifest["runner_sha256"],
                "packages": manifest["packages"],
            },
            "evaluation_notes": {
                "gold_execution_errors_counted_as_incorrect": [
                    {"index": row["index"], "db_id": row["db_id"], "error": row["gold_error"]}
                    for row in records if row["gold_error"] is not None
                ],
                "cases_with_truncated_output": [
                    {"index": row["index"], "truncated_calls": row["truncated_calls"]}
                    for row in records if row["truncated_calls"]
                ],
                "latency_measured_during_concurrent_run": True,
            },
        }
        destination = output_root / "bird" / method / vendor / model / linker
        destinations.append(destination)
        outputs[destination / "dev_pred.sql"] = "".join(sql + "\n" for sql in predictions)
        outputs[destination / "dev_pred_gt.sql"] = "".join(
            sql.replace("\t", " ") + "\t" + record["db_id"] + "\n"
            for sql, record in zip(predictions, records)
        )
        outputs[destination / "eval_result_dev.json"] = json_text(eval_rows)
        outputs[destination / "summary.json"] = json_text(summary)
    # Validate every destination before writing so unrelated historical runs
    # cannot be partially overwritten. Re-exporting identical results is safe.
    for path, content in outputs.items():
        if path.exists() and path.read_text(encoding="utf-8") != content:
            raise ValueError(f"Destination contains different results: {path}")
    for path, content in outputs.items():
        path.parent.mkdir(parents=True, exist_ok=True)
        if not path.exists():
            temporary = path.with_suffix(path.suffix + ".tmp")
            temporary.write_text(content, encoding="utf-8")
            temporary.replace(path)
    return destinations


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-dir", type=Path, required=True)
    parser.add_argument("--data", type=Path, default=ROOT / "data/bird/dev.json")
    parser.add_argument("--output-root", type=Path, default=ROOT / "output")
    args = parser.parse_args()
    try:
        destinations = export_results(args.run_dir, args.data, args.output_root)
    except (ValueError, KeyError, OSError) as error:
        parser.error(str(error))
    for destination in destinations:
        print(destination)
    print(f"Exported {len(destinations)} methods, 4 final files per method")


if __name__ == "__main__":
    main()
