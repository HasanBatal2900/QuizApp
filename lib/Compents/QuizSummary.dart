import 'package:flutter/material.dart';

class QuizSummary extends StatelessWidget {
  const QuizSummary(
      {super.key,
      required this.correctAnswer,
      required this.indexQuestion,
      required this.question,
      required this.userAnswer});

  final int indexQuestion;
  final String question;
  final String correctAnswer;
  final String userAnswer;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: correctAnswer == userAnswer
              ? Color.fromARGB(255, 104, 222, 157)
              : Color.fromARGB(255, 190, 79, 79),
          child: Text(
            "$indexQuestion",
            style: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(correctAnswer,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 92, 243, 200))),
              const SizedBox(
                height: 5,
              ),
              Text(
                userAnswer,
                style: TextStyle(color: Color.fromARGB(255, 20, 20, 21)),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
