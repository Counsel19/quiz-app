import "package:flutter/material.dart";

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  bool isAnswerCorrect(Map<String, Object> data) {
    return data["chosen_answer"] == data["corrent_answer"];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28.0,
                    height: 28.0,
                    decoration: BoxDecoration(
                      color: data["chosen_answer"] == data["corrent_answer"]
                          ? Colors.blue[300]
                          : Colors.pink[300],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "${(data["question_index"] as int) + 1}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data["chosen_answer"] as String,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.red[200],
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          data["corrent_answer"] as String,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.blue[200],
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
