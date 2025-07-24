import random;
import from mtllm.llm { Model }
import os;

glob llm = Model(
    model_name="gemini/gemini-2.0-flash",
    verbose=False,
    api_key=os.getenv("GEMINI_API_KEY")
);

def give_feedback(answer: str, correct_answer: str, question_text: str) -> str by llm();

walker TriviaQuiz {
    has current_answer: str = "";
    has score: int = 0;
    has asked_questions: list = [];
    
    can start with `root entry;
    can ask_question with question entry;
    can process_answer with question entry;
}

node question {
    has question_text: str;
    has correct_answer: str;
}

with entry:__main__ {
    root spawn TriviaQuiz();
}