from transformers import RobertaTokenizer, RobertaModel

from .EmbeddingFilter import EmbeddingFilter

class RobertaFilter(EmbeddingFilter):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        self.tokenizer = RobertaTokenizer.from_pretrained('roberta-base')
        self.model = RobertaModel.from_pretrained('roberta-base')