import logging
import math
import re
from typing import Any, List, Optional, Sequence

try:
    import json5 as json_parser
except ImportError:  # Strict JSON remains supported in minimal environments.
    import json as json_parser

from model.SQLPromptMix import _CandidateMethodBase


logger = logging.getLogger(__name__)


class MCSSelector(_CandidateMethodBase):
    """MCS-SQL-style multi-prompt generation and multiple-choice selection.

    This class implements the selector component with the benchmark's single
    language model. It does not claim the paper's unavailable probability-based
    filtering or model-specific confidence scores.
    """

    def __init__(self, args, **kwargs):
        self.max_prompt_families = max(1, int(kwargs.pop("max_prompt_families", 5)))
        self.min_selector_confidence = float(kwargs.pop("min_selector_confidence", 0.65))
        super().__init__(args, **kwargs)

        self.generation_system_prompt = (
            "You are a text-to-SQL expert. Return exactly one read-only SQLite query "
            "and no explanation."
        )
        self.selector_system_prompt = (
            "You are a conservative SQL selector. Choose an alternative only when its "
            "semantic fit to the question and schema is concretely better."
        )
        self.prompt_families = [
            (
                "Direct",
                "Derive the simplest correct query directly from the schema and question.",
            ),
            (
                "Schema linking",
                "First resolve entities, values, relevant columns, and join keys internally; "
                "then output only SQL.",
            ),
            (
                "Decomposition",
                "Internally decompose the request into subquestions and compose their SQL logic.",
            ),
            (
                "Query-plan-first",
                "Internally construct a relational plan covering joins, predicates, projection, "
                "aggregation, ordering, and limit before writing SQL.",
            ),
            (
                "Adversarial audit",
                "Guard against wrong join multiplicity, missing filters, wrong aggregation level, "
                "and incorrect DISTINCT, ORDER BY, or LIMIT behavior.",
            ),
        ]

    def inference(self, schema: str, question: str, evidence: str = None) -> str:
        schema_str = self.format_schema(schema)
        question_str = self.format_question(question, evidence)
        prompts = [
            self._candidate_prompt(schema_str, question_str, name, instruction)
            for name, instruction in self.prompt_families[: self.max_prompt_families]
        ]
        responses = self._generate_many(prompts, system_prompt=self.generation_system_prompt)
        candidates = self._unique_sql(self._extract_candidates(responses))
        fallback = candidates[0] if candidates else ";"

        if len(candidates) <= 1:
            return fallback

        options = self._execution_deduplicate(candidates)
        if not options:
            logger.info("No candidate executed successfully; using the first generated candidate.")
            return fallback
        if len(options) == 1:
            return options[0]

        # The original first candidate may have been removed after a concrete
        # execution failure.  Any selector-side failure must fall back to a
        # candidate known to have executed successfully.
        selection_fallback = options[0]

        selector_prompt = self._selector_prompt(schema_str, question_str, options)
        try:
            response = self._call_model(selector_prompt, self.selector_system_prompt)
        except Exception as error:
            logger.warning("Multiple-choice selection failed: %s", error)
            return selection_fallback

        selection = self._parse_selection(response, len(options))
        if selection is None:
            logger.warning(
                "Selector returned no valid 1-based candidate index; using the first "
                "successfully executed option."
            )
            return selection_fallback
        selected_index, reason, confidence, is_structured = selection
        if selected_index != 0 and (
            not is_structured
            or not reason
            or confidence < self.min_selector_confidence
        ):
            logger.warning(
                "Selector did not provide a high-confidence concrete comparison; "
                "using the first successfully executed option."
            )
            return selection_fallback
        return options[selected_index]

    def _execution_deduplicate(self, candidates: Sequence[str]) -> List[str]:
        """Keep one SQL per successful result; empty results are successful."""
        if getattr(self, "sql_executor", None) is None:
            return list(candidates)

        options = []
        seen_results = set()
        for candidate in candidates:
            result = self._safe_evaluate(candidate)
            if result is None or not result.get("ok"):
                continue
            signature = self._freeze(result.get("signature"))
            if signature in seen_results:
                continue
            seen_results.add(signature)
            options.append(candidate)
        return options

    @staticmethod
    def _candidate_prompt(
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

Generation approach: {family_name}
{instruction}

Return exactly one SQLite-compatible, read-only SELECT/WITH query. Output SQL only.
"""

    @staticmethod
    def _selector_prompt(schema: str, question: str, candidates: Sequence[str]) -> str:
        option_text = "\n\n".join(
            f"Candidate {index}:\n```sql\n{candidate}\n```"
            for index, candidate in enumerate(candidates, start=1)
        )
        return f"""Select the SQL query that best answers the question.

Database schema:
```
{schema}
```

Question (including any evidence):
{question}

All listed candidates have executed successfully. A zero-row result is valid and must not
be treated as evidence that a candidate is semantically wrong. Equivalent formulations are
acceptable. Check requested outputs, joins, filters and literals, aggregation, grouping,
ordering, DISTINCT, and limit semantics.

{option_text}

Return only a JSON object in this exact shape:
{{
  "selected_candidate": 1,
  "reason": "short concrete clause-by-clause comparison",
  "confidence": 0.0
}}
`selected_candidate` must be a 1-based integer from 1 through {len(candidates)}.
Choose a non-first candidate only with a concrete comparison and confidence of
at least 0.65. `confidence` must be a number from 0 to 1.
"""

    @classmethod
    def _parse_selected_index(cls, response: Any, option_count: int) -> Optional[int]:
        """Backward-compatible index-only parser for direct helper users."""
        selection = cls._parse_selection(response, option_count)
        return None if selection is None else selection[0]

    @classmethod
    def _parse_selection(
        cls,
        response: Any,
        option_count: int,
    ) -> Optional[tuple]:
        if option_count < 1 or not isinstance(response, str):
            return None
        text = cls.remove_think_content(response).strip()
        fenced = cls.fetch_code(text, code_type="json", default=text).strip()

        value = None
        reason = ""
        confidence = 0.0
        is_structured = False
        try:
            parsed = json_parser.loads(cls.extract_json_object(fenced))
            if isinstance(parsed, dict):
                is_structured = True
                for key in ("selected_candidate", "candidate_id", "selected_index", "choice"):
                    if key in parsed:
                        value = parsed[key]
                        break
                raw_reason = parsed.get("reason", "")
                reason = raw_reason.strip() if isinstance(raw_reason, str) else ""
                try:
                    confidence = float(parsed.get("confidence", 0.0))
                except (TypeError, ValueError):
                    confidence = 0.0
                confidence = (
                    max(0.0, min(1.0, confidence))
                    if math.isfinite(confidence)
                    else 0.0
                )
        except Exception:
            # Some models obey the multiple-choice instruction but return only "2" or "B".
            exact = re.fullmatch(
                r"(?i)\s*(?:(?:candidate|option|choice)\s*[:#-]?\s*)?([1-9]\d*|[a-z])\s*",
                fenced,
            )
            if exact:
                value = exact.group(1)

        index = cls._coerce_one_based_index(value)
        if index is None or not 1 <= index <= option_count:
            return None
        return index - 1, reason, confidence, is_structured

    @staticmethod
    def _coerce_one_based_index(value: Any) -> Optional[int]:
        if isinstance(value, bool):
            return None
        if isinstance(value, int):
            return value
        if isinstance(value, float):
            return int(value) if value.is_integer() else None
        if isinstance(value, str):
            value = value.strip()
            if re.fullmatch(r"[1-9]\d*", value):
                return int(value)
            if re.fullmatch(r"[A-Za-z]", value):
                return ord(value.upper()) - ord("A") + 1
        return None


if __name__ == "__main__":
    import utils

    MCSSelector(utils.get_args())
