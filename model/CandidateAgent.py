import logging
from collections import Counter
from typing import List

from model.Agent import Agent

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class CandidateAgent(Agent):
    def __init__(self, args, **kwargs):
        self.max_refine_candidates = kwargs.pop("max_refine_candidates", 3)
        super().__init__(args, **kwargs)

        self.refine_strategies = [
            "Make the smallest possible correction. Keep every literal, filter, join, and selected column unless feedback explicitly identifies it as wrong.",
            "Check schema alignment only: table names, column names, join keys, and value-bearing columns.",
            "Check requirement coverage only: requested outputs, filters, aggregation, grouping, sorting, and limit.",
        ]

    def check_and_refine_sql(self, schema: str, question: str, evidence: str, sql: str) -> str:
        question_str = self.format_question(question, evidence)
        schema_str = self.format_schema(schema)

        check_status = self.check_sql_status(sql, schema_str, question_str)
        logger.info(f"Check Status: {check_status}")

        if check_status.get("is_correct", True):
            return sql
        if not self.should_refine(check_status, sql):
            logger.info("Skip refinement because the verifier signal is low-confidence.")
            return sql

        reason = check_status.get("reason", "")
        candidates = [sql]
        candidates.extend(self.generate_refinement_candidates(schema_str, question_str, sql, reason))

        return self.select_sql_from_candidates(candidates, schema_str, question_str, check_status)

    def generate_refinement_candidates(self, schema_str: str, question_str: str, sql: str, reason: str) -> List[str]:
        prompts = []
        for strategy in self.refine_strategies[:self.max_refine_candidates]:
            prompts.append(self.get_refine_prompt(schema_str, question_str, sql, reason) + f"\nCorrection focus: {strategy}")

        responses = self.model.generate(prompts, system_prompt=self.refine_prompt)
        if isinstance(responses, str):
            responses = [responses]

        candidates = []
        for response in responses:
            candidate_sql = self.fetch_code(response, code_type="sql", default=";").strip()
            if candidate_sql and candidate_sql != ";":
                candidates.append(candidate_sql)
        return candidates

    def select_sql_from_candidates(
        self,
        candidates: List[str],
        schema_str: str,
        question_str: str,
        check_status: dict,
    ) -> str:
        unique_candidates = []
        seen = set()
        for candidate in candidates:
            normalized = self.normalize_sql_text(candidate)
            if normalized and normalized not in seen:
                unique_candidates.append(candidate)
                seen.add(normalized)

        if not unique_candidates:
            return ";"
        if len(unique_candidates) == 1:
            return unique_candidates[0]

        evaluated = [(candidate, self.evaluate_sql_candidate(candidate)) for candidate in unique_candidates]
        valid = [(candidate, result) for candidate, result in evaluated if result and result["ok"] and not result["is_empty"]]
        if len(valid) >= 2:
            result_counter = Counter(result["signature"] for _, result in valid)
            signature, count = result_counter.most_common(1)[0]
            if count > 1:
                for candidate, result in valid:
                    if result["signature"] == signature:
                        return candidate

        selected_sql = unique_candidates[0]
        for candidate_sql in unique_candidates[1:]:
            selected_sql = self.select_sql_candidate(selected_sql, candidate_sql, schema_str, question_str, check_status)
        return selected_sql