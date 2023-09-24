import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Q: ${currentQuestion.question}',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 199, 156, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                ),
            // ...List.generate(
            //   currentQuestion.answers.length,
            //   (index) => AnswerButton(
            //       answerText: currentQuestion.answers[index], onTap: () {}),
            // ),
            // AnswerButton(answerText: questions[0].answers[0], onTap: () {}),
            // AnswerButton(answerText: questions[0].answers[1], onTap: () {}),
            // AnswerButton(answerText: 'Answer 3', onTap: () {}),
            // AnswerButton(answerText: 'Answer 4', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
