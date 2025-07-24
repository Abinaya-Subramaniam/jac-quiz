impl TriviaQuiz.start {
    all_questions = [
        {"text": "What is the capital of France?", "answer": "Paris"},
        {"text": "Which planet is known as the Red Planet?", "answer": "Mars"},
        {"text": "What is 2 + 2?", "answer": "4"},
        {"text": "Who painted the Mona Lisa?", "answer": "Leonardo da Vinci"},
        {"text": "What is the largest mammal?", "answer": "Blue whale"}
    ];
    
    available_questions = [q for q in all_questions if q["text"] not in self.asked_questions];
    
    if len(available_questions) == 0 {
        print("No more questions available!");
        disengage;
    }
    
    question_pair = random.choice(available_questions);
    self.asked_questions.append(question_pair["text"]);
    
    first_question = question(
        question_text=question_pair["text"],
        correct_answer=question_pair["answer"]
    );
    root ++> first_question;
    visit first_question;
}

impl TriviaQuiz.ask_question {
    print("----------------------------------");
    print("Question: " + here.question_text);
    self.current_answer = input("Your answer: ");
    visit here;
}

impl TriviaQuiz.process_answer {
    if self.current_answer.lower() == here.correct_answer.lower() {
        self.score += 1;
        print("\n" + "Correct! Well done.");
        print("Your score: " + str(self.score) + "\n");
    } else {
        feedback = give_feedback(self.current_answer, here.correct_answer, here.question_text);
        print("\n" + "Incorrect!");
        print(feedback);
        print("Your score: " + str(self.score) + "\n");
    }
    
    continue_game = input("Continue? (y/n): ").lower();
    if continue_game == "y" {
        all_questions = [
            {"text": "What is the capital of France?", "answer": "Paris"},
            {"text": "Which planet is known as the Red Planet?", "answer": "Mars"},
            {"text": "What is 2 + 2?", "answer": "4"},
            {"text": "Who painted the Mona Lisa?", "answer": "Leonardo da Vinci"},
            {"text": "What is the largest mammal?", "answer": "Blue whale"}
        ];
        
        available_questions = [q for q in all_questions if q["text"] not in self.asked_questions];
        
        if len(available_questions) == 0 {
            print("No more questions available!");
            print("\n" + "Final score: " + str(self.score));
            print("Thanks for playing!\n");
            disengage;
        }
        
        question_pair = random.choice(available_questions);
        self.asked_questions.append(question_pair["text"]);
        
        new_question = question(
            question_text=question_pair["text"],
            correct_answer=question_pair["answer"]
        );
        here ++> new_question;
        visit new_question;
    } else {
        print("\n" + "Final score: " + str(self.score));
        print("Thanks for playing!\n");
        disengage;
    }
}