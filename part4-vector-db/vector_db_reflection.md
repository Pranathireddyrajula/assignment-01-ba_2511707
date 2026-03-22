## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for searching large legal contracts using natural language queries.Keyword-based systems rely on exact word matching, which means they may miss relevant information if the query uses different wording than the document. For example, a query like "termination clauses" might not return results if the contract uses phrases like "agreement cancellation terms" instead. A normal search would completely miss these lines because it only looks for the exact words typed, not what they mean.
This is the main problem. Lawyers search in plain English but contracts are written in formal legal language. The same idea can be written in ten different ways across a 500 page document. Keyword search cannot handle that.

A vector database solves this. The way it works is that every paragraph in the contract is converted into a set of numbers called a vector. These numbers represent the meaning of that paragraph, not just the words. When the lawyer types a question, that question is also converted into a vector. The system then finds the paragraphs whose meaning is closest to the question.

So even if the lawyer asks "can we cancel this contract early?", the system will still find the right section because the meaning matches, even if the words are completely different.

To build this, you would split the contract into small chunks, generate embeddings for each chunk using a model like sentence-transformers, store them in a vector database like ChromaDB or Pinecone, and then search by similarity when a question comes in.

This kind of search actually understands what you are looking for, which makes it much more useful for legal documents than a simple keyword search.