import unittest

from model.Agent import Agent


class FakeExecutor:
    def __init__(self, failing_sql=None):
        self.failing_sql = failing_sql or set()

    def execute_sql(self, sql):
        if sql in self.failing_sql:
            return {"sqlite_error": "near bad: syntax error"}
        return {"data": [(1,)]}


class AgentGuardTests(unittest.TestCase):
    def make_agent(self):
        agent = Agent.__new__(Agent)
        agent.sql_executor = None
        agent.min_refine_confidence = 0.75
        agent.max_candidate_result_rows = 50
        return agent

    def test_unparseable_verifier_response_is_conservative(self):
        agent = self.make_agent()

        status = agent.parse_check_status("not json")

        self.assertTrue(status["is_correct"])
        self.assertFalse(status["needs_refinement"])
        self.assertEqual(status["confidence"], 0.0)

    def test_refined_sql_dropping_question_anchor_is_rejected(self):
        agent = self.make_agent()
        question = "State the district and region for loan ID '4990'."
        original_sql = "SELECT district_id FROM loan WHERE loan_id = 4990"
        refined_sql = "SELECT district_id FROM loan WHERE loan_id = 4959"

        selected_sql = agent.select_sql_candidate(
            original_sql,
            refined_sql,
            schema_str="",
            question_str=question,
            check_status={"confidence": 1.0, "needs_refinement": True},
        )

        self.assertEqual(selected_sql, original_sql)

    def test_equivalent_date_formats_are_not_rejected(self):
        agent = self.make_agent()
        question = "There was a loan approved in 1994/8/25."
        original_sql = "SELECT account_id FROM loan WHERE date = '1994-08-25'"
        refined_sql = "SELECT account_id FROM loan WHERE date = '1994/8/25'"

        lost_anchors = agent.lost_question_anchors(question, original_sql, refined_sql)

        self.assertEqual(lost_anchors, [])

    def test_execution_guard_prefers_working_refinement_over_failing_original(self):
        agent = self.make_agent()
        agent.sql_executor = FakeExecutor(failing_sql={"SELECT bad"})

        selected_sql = agent.select_sql_candidate(
            "SELECT bad",
            "SELECT 1",
            schema_str="",
            question_str="How many records are there?",
            check_status={"confidence": 1.0, "needs_refinement": True},
        )

        self.assertEqual(selected_sql, "SELECT 1")

    def test_execution_guard_keeps_working_original_over_failing_refinement(self):
        agent = self.make_agent()
        agent.sql_executor = FakeExecutor(failing_sql={"SELECT bad"})

        selected_sql = agent.select_sql_candidate(
            "SELECT 1",
            "SELECT bad",
            schema_str="",
            question_str="How many records are there?",
            check_status={"confidence": 1.0, "needs_refinement": True},
        )

        self.assertEqual(selected_sql, "SELECT 1")


if __name__ == "__main__":
    unittest.main()