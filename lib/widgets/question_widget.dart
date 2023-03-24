import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question,
    required this.ind,
    required this.total,
  });
  final String question;
  final int ind;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Qustion ${ind + 1}/$total: $question',
        style: const TextStyle(
          fontSize: 22,
          color: Color.fromARGB(255, 2, 52, 93),
        ),
      ),
    );
  }
}
