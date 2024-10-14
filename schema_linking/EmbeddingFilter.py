import torch
import torch.nn.functional as F
from transformers import PreTrainedTokenizer, PreTrainedModel
from typing import List

from .SchemaLinker import SchemaLinker

class EmbeddingFilter(SchemaLinker):
    def __init__(self, **kwargs) -> None:
        super().__init__(**kwargs)
        self.tokenizer: PreTrainedTokenizer = None
        self.model: PreTrainedModel = None
        
        self.similarity_threshold = kwargs.pop("similarity_threshold", 0.5)
        self.device = kwargs.pop(
            "device",
            torch.device("cuda" if torch.cuda.is_available() else "cpu")
        )

    def _get_selected_columns(self, query: str, table_name: str, columns_info: List, **kwargs) -> List[str]:
        foreign_keys_set = kwargs.get("foreign_keys_set", set())

        # generate embeddings for query
        query_embeddings = self._get_text_embeddings(query)
        
        # calculate columns similarities
        fully_qualified_names = [f"{table_name}.{column_info[1]}" for column_info in columns_info]
        columns_embeddings = self._get_text_embeddings(fully_qualified_names)
        columns_similarity = F.cosine_similarity(query_embeddings, columns_embeddings)
        # for column_name, column_similarity in zip(fully_qualified_names, columns_similarity):
        #     print(column_name, column_similarity)
        # print()

        selected_columns = [
            column_info[1]
            for column_info, column_similarity in zip(columns_info, columns_similarity)
            if (
                column_similarity > self.similarity_threshold
                or column_info[5]  # primary key
                or f"{table_name}.{column_info[1]}" in foreign_keys_set
            )
        ]
        
        # if all columns are foreign key, this table is not used
        if all(f"{table_name}.{column_name}" in foreign_keys_set for column_name in selected_columns):
            selected_columns = []

        return selected_columns

    def _get_text_embeddings(self, text):
        tokens = self.tokenizer(text, padding=True, return_tensors='pt').to(self.device)
        with torch.no_grad():
            self.model.to(self.device)
            embeddings = self.model(**tokens).last_hidden_state.mean(dim=1)
        return embeddings


    def _embedding_similarity_kl(self, embedding1, embedding2):
        """Compute similarity between two embeddings using KL divergence."""
        # Convert embeddings to probability distributions using softmax
        p = F.softmax(embedding1, dim=0)
        q = F.softmax(embedding2, dim=0)
        
        # Compute KL(P||Q) and KL(Q||P)
        kl_pq = F.kl_div(q.log(), p, reduction='sum')
        kl_qp = F.kl_div(p.log(), q, reduction='sum')
        
        # Use the average of KL(P||Q) and KL(Q||P) as symmetric measure
        avg_kl = (kl_pq + kl_qp) / 2
        
        # Convert divergence to similarity (higher value means more similar)
        similarity = 1 / (1 + avg_kl)
        
        return similarity