import 'package:flutter/material.dart';
import 'package:quiz_app/Model/Questions.dart';
import 'package:quiz_app/Provider/ThemeData.dart';
import 'package:quiz_app/Screens/ResultScreen.dart';
import 'package:provider/provider.dart';
import 'HomeScreen.dart';
import 'QuestionsScreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  //Another way
  String? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = "Home";

    // activeScreen = HomeScreen(switchScreen: swwitchScreen);
  }

  void addAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "Result";
      });
    }
  }

  void printSelectedAnswer() {
    for (var i = 0; i < selectedAnswers.length; i++) {
      print(selectedAnswers[i] + "\n");
    }
  }

  void switchScreen() {
    if (activeScreen == "Home") {
      setState(() {
        //activeScreen="Question_Screen"
        activeScreen = "Question";
      });
    } else if (activeScreen == "Result") {
      setState(() {
        //activeScreen="Question_Screen"
        selectedAnswers = [];
        activeScreen = "Home";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    if (activeScreen == "Home") {
      currentScreen = HomeScreen(switchScreen: switchScreen);
    } else if (activeScreen == "Question") {
      currentScreen = QuestionScreen(
          addAnswer: addAnswer, printAnswers: printSelectedAnswer);
    } else {
      currentScreen = ResultScreen(
        ChosenAnswers: selectedAnswers,
        restartQuiz: switchScreen,
      );
    }
    return ChangeNotifierProvider(
      create: (context) => ThemeingData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.indigo],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: currentScreen //
                )),
      ),
    );
  }
}

/// Use A name for the Screen if it is
/// start_scren then display the HomeScreen And The Same for QuestionScreen
