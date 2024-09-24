from transformers import AutoModel, AutoTokenizer

from .EmbeddingFilter import EmbeddingFilter

class GteFilter(EmbeddingFilter):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        self.tokenizer = AutoTokenizer.from_pretrained('Alibaba-NLP/gte-large-en-v1.5')
        self.model = AutoModel.from_pretrained('Alibaba-NLP/gte-large-en-v1.5', trust_remote_code=True)