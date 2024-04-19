import "package:flutter/material.dart";
import "package:quiz_app/models/questions.dart";
import "package:quiz_app/questions_summary.dart";

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestartScreen});

  final void Function() onRestartScreen;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "corrent_answer": questions[i].options[0],
        "chosen_answer": chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data["chosen_answer"] == data["correct_answer"])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You Answered $numCorrectQuestions out of $numTotalQuestions Questions Correctly!",
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            TextButton.icon(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: onRestartScreen,
                icon: const Icon(Icons.restart_alt),
                label: const Text("Retart Quiz"))
          ],
        ),
      ),
    );
  }
}
