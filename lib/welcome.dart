import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class WelcomScreen extends StatelessWidget {
  final void Function() startQuiz;

  const WelcomScreen(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/quiz-logo.png",
          width: 300,
          color: const Color.fromARGB(116, 255, 255, 255),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Learn Flutter the fun way!",
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
          ),
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          ),
          label: const Text(
            "Start Quiz",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }
}
