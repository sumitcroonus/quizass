import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({
    super.key,
    required this.index,
    required this.length,
  });
  final int length;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 2, 52, 93),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth * ((index + 1) / length),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.lightGreen, Colors.green],
                  ),
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Progress",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromARGB(255, 1, 29, 53)),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
