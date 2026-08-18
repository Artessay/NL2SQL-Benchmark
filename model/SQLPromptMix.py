import logging
import re
from collections import Counter
from typing import Any, Dict, List, Optional, Sequence

from model.Agent import Agent
from model._sql_safety import has_quoted_function_call


logger = logging.getLogger(__name__)


class _CandidateMethodBase(Agent):
    """Shared, dependency-free helpers for model-only candidate methods."""

    _WRITE_TOKENS = re.compile(
        r"\b(?:insert|update|delete|replace|drop|alter|create|attach|detach|"
        r"vacuum|reindex|analyze|pragma|begin|commit|rollback|savepoint|release|"
        r"load_extension|writefile)\b",
        flags=re.IGNORECASE,
    )
    _SIDE_EFFECT_FUNCTIONS = {"load_extension", "writefile"}

    def __call__(self, schema: str, question: str, evidence: str = None) -> str:
        """Run without Base's hidden re-generation and enforce a safe final SQL."""
        try:
            sql = self.inference(schema, question, evidence)
        except KeyboardInterrupt:
            raise
        except Exception:
            logger.exception(
                "%s failed; refusing Base's unguarded fallback generation.",
                self.__class__.__name__,
            )
            return ";"

        if not isinstance(sql, str):
            logger.error("%s returned a non-string SQL value.", self.__class__.__name__)
            return ";"
        sql = sql.strip()
        if sql == ";":
            return sql
        if not self._is_read_only_sql(sql):
            logger.error(
                "%s returned a value that is not one read-only SELECT/WITH query.",
                self.__class__.__name__,
            )
            return ";"
        return sql

    def _call_model(self, prompt: Any, system_prompt: Optional[str] = None) -> Any:
        if system_prompt is None:
            return self.model.generate(prompt)
        return self.model.generate(prompt, system_prompt=system_prompt)

    def _generate_many(
        self,
        prompts: Sequence[str],
        system_prompt: Optional[str] = None,
    ) -> List[str]:
        """Use batch generation when available and safely fall back to singles."""
        prompts = list(prompts)
        if not prompts:
            return []

        try:
            responses = self._call_model(prompts, system_prompt)
            if isinstance(responses, str):
                if len(prompts) == 1:
                    return [responses]
                raise TypeError("the language model returned one string for a prompt batch")
            responses = list(responses)
            if len(responses) != len(prompts):
                raise ValueError(
                    f"the language model returned {len(responses)} responses for "
                    f"{len(prompts)} prompts"
                )
            return [response if isinstance(response, str) else str(response) for response in responses]
        except Exception as batch_error:
            logger.warning("Batch generation failed; retrying one prompt at a time: %s", batch_error)

        responses = []
        for prompt in prompts:
            try:
                response = self._call_model(prompt, system_prompt)
                responses.append(response if isinstance(response, str) else str(response))
            except Exception as error:
                logger.warning("Candidate generation failed: %s", error)
                responses.append("")
        return responses

    def _extract_candidates(self, responses: Sequence[str]) -> List[str]:
        candidates = []
        for response in responses:
            try:
                sql = self.fetch_code(response, code_type="sql", default=";").strip()
                # Base.fetch_code handles the common ```sql\n form; also accept
                # capitalization and Windows line endings used by some providers.
                sql = re.sub(r"^(?:sql|sqlite)\s*\r?\n", "", sql, count=1, flags=re.IGNORECASE).strip()
            except Exception as error:
                logger.warning("Could not extract a SQL candidate: %s", error)
                continue
            if sql and sql != ";" and self._is_read_only_sql(sql):
                candidates.append(sql)
            elif sql and sql != ";":
                logger.warning("Discarding a candidate that is not a single read-only query.")
        return candidates

    def _unique_sql(self, candidates: Sequence[str]) -> List[str]:
        unique = []
        seen = set()
        for candidate in candidates:
            normalized = self.normalize_sql_text(candidate)
            if normalized and normalized not in seen:
                seen.add(normalized)
                unique.append(candidate)
        return unique

    @classmethod
    def _is_read_only_sql(cls, sql: str) -> bool:
        """Conservatively admit one SELECT/WITH statement for database probing."""
        if not isinstance(sql, str) or not sql.strip():
            return False
        if has_quoted_function_call(sql, cls._SIDE_EFFECT_FUNCTIONS):
            return False

        lexical_sql = cls._remove_literals_identifiers_and_comments(sql).strip()
        if lexical_sql.endswith(";"):
            lexical_sql = lexical_sql[:-1].rstrip()
        if not lexical_sql or ";" in lexical_sql:
            return False
        if re.match(r"^(?:select|with)\b", lexical_sql, flags=re.IGNORECASE) is None:
            return False
        return cls._WRITE_TOKENS.search(lexical_sql) is None

    @staticmethod
    def _remove_literals_identifiers_and_comments(sql: str) -> str:
        """Blank quoted text/comments so safety checks inspect only SQL tokens."""
        output = []
        index = 0
        length = len(sql)
        while index < length:
            char = sql[index]
            following = sql[index + 1] if index + 1 < length else ""

            if char == "-" and following == "-":
                index += 2
                while index < length and sql[index] not in "\r\n":
                    index += 1
                output.append(" ")
                continue
            if char == "/" and following == "*":
                index += 2
                while index + 1 < length and not (sql[index] == "*" and sql[index + 1] == "/"):
                    index += 1
                index = min(length, index + 2)
                output.append(" ")
                continue
            if char in {"'", '"', "`"}:
                quote = char
                index += 1
                while index < length:
                    if sql[index] == quote:
                        if index + 1 < length and sql[index + 1] == quote:
                            index += 2
                            continue
                        index += 1
                        break
                    # SQLite quotes are escaped by doubling the quote. A
                    # backslash does not escape it and must not hide following
                    # control tokens from the safety lexer.
                    index += 1
                output.append(" ")
                continue
            if char == "[":
                index += 1
                while index < length and sql[index] != "]":
                    index += 1
                index = min(length, index + 1)
                output.append(" ")
                continue

            output.append(char)
            index += 1
        return "".join(output)

    def _safe_evaluate(self, sql: str) -> Optional[Dict[str, Any]]:
        if not self._is_read_only_sql(sql):
            return {
                "ok": False,
                "data": None,
                "signature": None,
                "is_empty": False,
                "error": "candidate is not a single read-only SELECT/WITH query",
            }
        evaluation = self.evaluate_sql_candidate(sql)
        if evaluation is not None and evaluation.get("ok"):
            # Agent.result_signature intentionally caps results at 50 rows and
            # preserves row order.  BIRD EX compares the complete result as a
            # set, so candidate voting/deduplication must use the same semantics.
            evaluation = dict(evaluation)
            evaluation["signature"] = self._canonical_result_signature(
                evaluation.get("data")
            )
        return evaluation

    @classmethod
    def _canonical_result_signature(cls, data: Any) -> frozenset:
        """Return BIRD-EX-style full set semantics with hashable row values."""
        if data is None:
            return frozenset()
        try:
            return frozenset(cls._freeze(row) for row in data)
        except TypeError:
            # SqlExecutor normally returns a list of rows.  Keep unusual fake or
            # third-party executors deterministic and hashable as well.
            return frozenset({cls._freeze(data)})

    @classmethod
    def _freeze(cls, value: Any) -> Any:
        """Make executor results hashable without relying on row value types."""
        if isinstance(value, dict):
            return tuple(
                sorted(
                    ((cls._freeze(key), cls._freeze(item)) for key, item in value.items()),
                    key=repr,
                )
            )
        if isinstance(value, (list, tuple)):
            return tuple(cls._freeze(item) for item in value)
        if isinstance(value, set):
            return tuple(sorted((cls._freeze(item) for item in value), key=repr))
        try:
            hash(value)
            return value
        except TypeError:
            return repr(value)


class SQLPromptMix(_CandidateMethodBase):
    """A model-only SQLPrompt-style prompt ensemble with execution voting.

    This implements the prompt-mixing and execution-consistency component, not
    the original paper's heterogeneous-model setup.
    """

    def __init__(self, args, **kwargs):
        self.max_prompt_families = max(1, int(kwargs.pop("max_prompt_families", 5)))
        super().__init__(args, **kwargs)

        self.generation_system_prompt = (
            "You are a careful text-to-SQL expert. Produce exactly one read-only SQL "
            "query and no explanation. Never modify the database."
        )
        self.prompt_families = [
            (
                "Direct schema grounding",
                "Solve the question directly. Ground every table and column in the schema, "
                "and preserve every literal from the question or evidence.",
            ),
            (
                "Relational decomposition",
                "Privately decompose the request into requested output, tables, joins, filters, "
                "aggregation, ordering, and limit; then emit only the final SQL.",
            ),
            (
                "Join and predicate audit",
                "Prioritize correct join paths, value-bearing columns, comparison operators, "
                "NULL behavior, and all required predicates.",
            ),
            (
                "Aggregation audit",
                "Prioritize aggregation level, GROUP BY, DISTINCT, HAVING, ordering, superlatives, "
                "and top-k semantics while answering exactly what was requested.",
            ),
            (
                "Evidence-first grounding",
                "Use the supplied evidence as semantic guidance. Check entity values and temporal "
                "or numeric constraints before emitting the final SQL.",
            ),
        ]

    def inference(self, schema: str, question: str, evidence: str = None) -> str:
        schema_str = self.format_schema(schema)
        question_str = self.format_question(question, evidence)
        families = self.prompt_families[: self.max_prompt_families]
        prompts = [
            self._family_prompt(schema_str, question_str, family_name, instruction)
            for family_name, instruction in families
        ]
        responses = self._generate_many(prompts, system_prompt=self.generation_system_prompt)
        candidates = self._extract_candidates(responses)
        fallback = candidates[0] if candidates else ";"

        if not candidates or getattr(self, "sql_executor", None) is None:
            return fallback

        executed = []
        for index, candidate in enumerate(candidates):
            result = self._safe_evaluate(candidate)
            # An empty result is still a successful execution and therefore a vote.
            if result is not None and result.get("ok"):
                signature = self._freeze(result.get("signature"))
                executed.append((index, candidate, signature))

        if not executed:
            logger.info("No prompt-family candidate executed successfully; using the first candidate.")
            return fallback

        counts = Counter(signature for _, _, signature in executed)
        best_count = max(counts.values())
        winning_signatures = {signature for signature, count in counts.items() if count == best_count}
        # Iteration order is prompt-family order, making ties deterministic.
        for _, candidate, signature in executed:
            if signature in winning_signatures:
                return candidate
        return fallback

    @staticmethod
    def _family_prompt(
        schema: str,
        question: str,
        family_name: str,
        instruction: str,
    ) -> str:
        return f"""Database schema:
```
{schema}
```

Question (including any evidence):
{question}

Prompt family: {family_name}
{instruction}

Return exactly one SQLite-compatible, read-only SELECT/WITH query. Output SQL only.
"""


if __name__ == "__main__":
    import utils

    SQLPromptMix(utils.get_args())
