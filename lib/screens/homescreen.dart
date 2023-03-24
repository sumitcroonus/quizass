import 'package:flutter/material.dart';
import 'package:quizass/models/question.dart';
import 'package:quizass/widgets/button.dart';
import 'package:quizass/widgets/options.dart';
import 'package:quizass/widgets/progress.dart';
import 'package:quizass/widgets/question_widget.dart';
import 'package:quizass/widgets/score.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final backgroundColor = Colors.white;
  List<Question> _question = [
    Question(id: '1', question: 'What is Color of Water ?', options: {
      'green': false,
      'red': false,
      'blue': true,
      'pink': false,
    }),
    Question(id: '1', question: 'What is Color of sky ?', options: {
      'green': false,
      'red': false,
      'blue': true,
      'pink': false,
    }),
    Question(id: '1', question: 'What is Color of leaf ?', options: {
      'green': true,
      'red': false,
      'blue': false,
      'pink': false,
    }),
  ];
  int index = 0;
  int score = 0;
  void nextQuestuion() {
    if (index == _question.length - 1) {
      showDialog(
        context: context,
        builder: (cont) => Score(
            gotScore: score,
            totalScore: (_question.length * 10),
            onPressed: startAgain),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isSelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text("Please answer the question in order to move forward."),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  bool isPressed = false;
  bool isSelected = false;
  void changeColor(bool value) {
    if (isSelected) {
      return;
    } else {
      if (value == true) {
        score = score + 10;
        // print(score);
        setState(() {
          isPressed = true;
          isSelected = true;
        });
      } else {
        score = score + 0;
        setState(() {
          isPressed = true;
          isSelected = true;
        });
      }
    }
  }

  int previousScore = 0;
  void startAgain() {
    setState(() {
      index = 0;
      previousScore = score;
      score = 0;
      isPressed = false;
      isSelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('QuizAss'),
        backgroundColor: const Color.fromARGB(255, 2, 52, 93),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Progress(index: index, length: _question.length),
            const SizedBox(
              height: 20,
            ),
            QuestionWidget(
                question: _question[index].question,
                ind: index,
                total: _question.length),
            const Divider(
              color: Color.fromARGB(255, 1, 29, 53),
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            for (int i = 0; i < _question[index].options.length; i++)
              GestureDetector(
                onTap: () =>
                    changeColor(_question[index].options.values.toList()[i]),
                child: Options(
                  option: _question[index].options.keys.toList()[i],
                  color: isPressed
                      ? _question[index].options.values.toList()[i] == true
                          ? Colors.green
                          : Colors.red
                      : const Color.fromARGB(255, 2, 52, 93),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Button(next: nextQuestuion),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
