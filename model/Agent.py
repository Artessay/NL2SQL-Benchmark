
from model import Base

class Agent(Base):
    def __init__(self, args):
        super().__init__(args)

        self.memory = []

    def inference(self, schema:str, question:str, evidence:str = None):
        pass