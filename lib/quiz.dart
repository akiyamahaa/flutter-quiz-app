import 'package:flutter/material.dart';
import 'package:quizz_app/data/questions.dart';
import 'package:quizz_app/questions_screen.dart';
import 'package:quizz_app/splash_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  Widget? activeScreen;

  // Call after the widget is inserted into the widget tree
  @override
  void initState() {
    activeScreen = SplashScreen(startQuiz: switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    // You can add logic to handle the answer selection here
    if (selectedAnswer.length == questions.length) {
      setState(() {
        selectedAnswer = [];
        activeScreen = SplashScreen(startQuiz: switchScreen);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(selectedAnswer);

    return MaterialApp(
      title: ' Quiz App',
      home: Scaffold(
        body: Container(color: Colors.purple, child: activeScreen),
      ),
    );
  }
}
