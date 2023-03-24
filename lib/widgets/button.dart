import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.next});
  final VoidCallback next;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: next,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 2, 52, 93),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: const Text(
          'Next',
          style: TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
