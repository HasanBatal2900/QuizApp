import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/Compents/CustomElvatedBtn.dart';
import 'package:quiz_app/Model/Questions.dart';
import 'package:quiz_app/Provider/ThemeData.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {required this.addAnswer, super.key, required this.printAnswers});

  final Function(String) addAnswer;
  final Function() printAnswers;
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int index = 0;
  void nextQusetion() {
    index += 1;
  }
  //Another way To add the Answer is :
  // void nextQuestion(String selectedAnswer)
  //{
  // widget.addAnswer(answer);
  //index+=1;
  //
  //}
  //And in The onTap inside the SetState (){
  // nextQuestion(a)
  //}
  //

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];
    return SizedBox(
      width: double.infinity,
      child: Consumer<ThemeingData>(
        builder: (context, theme, child) {
        return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                currentQuestion.question,
                style: theme.lightTheme.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledList().map(
              (answerBtn) {
                return CustomElavatedBtn(
                    answer: answerBtn,
                    onTap: () {
                      setState(() {
                        if (index < questions.length - 1) {
                          widget.addAnswer(answerBtn);
      
                          nextQusetion();
                        } else {
                          widget.printAnswers();
                          index = 0;
                        }
                      });
                    });
              },
            ),
          ],);
        },
       
        
      
    ));
  }
}
