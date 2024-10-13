
from langchain.chains import ConversationChain
from langchain_openai import ChatOpenAI
from langchain.memory import ConversationBufferMemory



llm = ChatOpenAI(
    model="qwen2-72b-instruct", 
    base_url="https://dashscope.aliyuncs.com/compatible-mode/v1", 
    logprobs=True
)

# 初始化对话记忆
memory = ConversationBufferMemory(memory_key="chat_history", return_messages=True)

# 创建对话链
conversation = ConversationChain(
    llm=llm,
    memory=memory,
    verbose=True
)

# 多轮对话示例
while True:
    user_input = input("用户: ")
    if user_input.lower() in ["退出", "exit", "quit"]:
        print("对话结束。")
        break
    response = conversation.run(user_input)
    print(f"AI: {response}")
