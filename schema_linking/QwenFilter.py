import torch
from sentence_transformers import SentenceTransformer

from .EmbeddingFilter import EmbeddingFilter

class QwenFilter(EmbeddingFilter):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        self.model: SentenceTransformer = SentenceTransformer("Alibaba-NLP/gte-Qwen2-7B-instruct", trust_remote_code=True)
        self.similarity_threshold = kwargs.pop("similarity_threshold", 0.3)

    def _get_text_embeddings(self, text) -> torch.Tensor:
        return self.model.encode(text, convert_to_tensor=True)