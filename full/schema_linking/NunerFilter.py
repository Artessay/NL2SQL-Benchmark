from transformers import AutoModel, AutoTokenizer

from .EmbeddingFilter import EmbeddingFilter

class NunerFilter(EmbeddingFilter):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        self.tokenizer = AutoTokenizer.from_pretrained('numind/NuNER-v2.0')
        self.model = AutoModel.from_pretrained('numind/NuNER-v2.0')