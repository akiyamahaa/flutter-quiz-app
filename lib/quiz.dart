import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/results_screen.dart';
import 'package:quizz_app/splash_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  String? activeScreen;

  // Call after the widget is inserted into the widget tree
  @override
  void initState() {
    activeScreen = 'active-screen';
    super.initState();
  }

  void switchScreen() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'question-screen';
    });
  }

  void backtoStart() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'active-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    // You can add logic to handle the answer selection here
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = SplashScreen(startQuiz: switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        selectedAnswers: selectedAnswer,
        onRestart: switchScreen,
        onExit: backtoStart,
      );
    }

    return MaterialApp(
      title: ' Quiz App',
      home: Scaffold(
        body: Container(color: Colors.purple, child: screenWidget),
      ),
    );
  }
}
