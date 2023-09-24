import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final Function() onTap;

  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 13),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 84, 14, 112),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
    );
  }
}
