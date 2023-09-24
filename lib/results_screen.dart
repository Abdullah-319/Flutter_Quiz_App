import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

// ignore: must_be_immutable
class ResultsScreen extends StatelessWidget {
  ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.moveToStartScreen,
  });

  final List<String> chosenAnswers;
  void Function() moveToStartScreen;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 247, 207, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(listData: getSummary()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: moveToStartScreen,
              label: const Text('Restart Quiz'),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(
                Icons.replay,
              ),
            )
          ],
        ),
      ),
    );
  }
}
