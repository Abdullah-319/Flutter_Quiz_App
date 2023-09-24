import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/segments/question_identifier.dart';

// ignore: must_be_immutable
class Summary extends StatelessWidget {
  Summary({required this.summaryData, super.key});

  Map<String, Object> summaryData;

  bool checkAnswer() {
    bool flag = summaryData['user_answer'] == summaryData['correct_answer'];
    return flag;
  }

  int questionIndex() {
    int index = summaryData['question_index'] as int;
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: checkAnswer(),
            questionIndex: questionIndex(),
          ),
          const SizedBox(
            width: 22,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  summaryData['question'] as String,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  summaryData['user_answer'] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 192, 192, 192),
                  ),
                ),
                Text(
                  summaryData['correct_answer'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.lightGreen,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
