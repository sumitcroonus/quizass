import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({
    super.key,
    required this.option,
    required this.color,
  });
  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,

      // color: const Color.fromARGB(255, 2, 52, 93),
      child: ListTile(
        title: Text(
          option,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
