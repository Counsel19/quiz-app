import "package:flutter/material.dart";
import "package:quiz_app/gradient_container.dart";
import "package:quiz_app/welcome.dart";
import "package:quiz_app/result_screen.dart";
import "package:quiz_app/questions_screen.dart";
import "package:quiz_app/models/questions.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  String activeScreen = "welcome-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = "welcome-screen";
      selectedAnswer = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = WelcomScreen(switchScreen);

    if (activeScreen == "questions-screen") {
      currentScreen = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == "result-screen") {
      currentScreen = ResultsScreen(chosenAnswers: selectedAnswer, onRestartScreen: restartQuiz);
    }

    return MaterialApp(
      title: "Quiz Application",
      home: Scaffold(
        body: GradientContainer(
          const [
            Color.fromARGB(255, 103, 4, 145),
            Color.fromARGB(255, 77, 24, 112)
          ],
          widget: currentScreen,
        ),
      ),
    );
  }
}
