import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({
    super.key,
    required this.gotScore,
    required this.totalScore,
    required this.onPressed,
  });
  final int gotScore;
  final int totalScore;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 2, 52, 93),
      content: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Score',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 60,
              backgroundColor: gotScore == totalScore
                  ? Colors.green[600]
                  : gotScore < totalScore / 3
                      ? Colors.red
                      : Colors.orange,
              // foregroundColor: Colors.white,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 2, 52, 93),
                child: Text(
                  '$gotScore/$totalScore',
                  style: const TextStyle(fontSize: 27),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              gotScore == totalScore
                  ? 'Great!'
                  : gotScore < totalScore / 3
                      ? 'Try Again!'
                      : 'Almost There!',
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text(
                'Start Over',
                style: TextStyle(fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
