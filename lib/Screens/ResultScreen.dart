import 'package:flutter/material.dart';
import 'package:quiz_app/Compents/QuizSummary.dart';
import 'package:quiz_app/Model/Questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.ChosenAnswers, required this.restartQuiz});
  final List<String> ChosenAnswers;
  final Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> getSummary() {
      List<Map<String, Object>> summary = [];
      for (var i = 0; i < ChosenAnswers.length; i++) {
        summary.add({
          "question_index": i + 1,
          "question": questions[i].question,
          "correct_answer": questions[i].answers[0],
          "user_answer": ChosenAnswers[i],
        });
      }
      return summary;
    }

    var summary = getSummary();
    int getNumberOfCorrectAnswers(List<Map<String, Object>> summary) {
      int count = 0;
      for (var i = 0; i < summary.length; i++) {
        if (summary[i]["correct_answer"].toString() ==
            summary[i]["user_answer"].toString()) {
          count++;
        }
      }
      return count;
    }

    int correctAnswer = getNumberOfCorrectAnswers(summary);
    // final correct = getSummary()
    //     .where((data) => data["user_answer"] == data["correct_answer"])
    //     .length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40), //40
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            "You answered $correctAnswer out 6 questions correctly!",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 350,
            child: ListView(children: [
              ...summary.map((item) {
                return QuizSummary(
                    correctAnswer: item["correct_answer"] as String,
                    indexQuestion: item["question_index"] as int,
                    question: item["question"].toString(),
                    userAnswer: item["user_answer"].toString());
              })
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: restartQuiz,
            label: const Text(
              "Restart Quiz",
              style: TextStyle(color: Color.fromARGB(255, 226, 229, 244)),
            ),
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
