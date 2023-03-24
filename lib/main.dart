import 'package:flutter/material.dart';
import 'package:quizass/models/question.dart';
import '/models/Db.dart';
import 'screens/homescreen.dart';

void main() {
  var db = DBConn();
  db.addQuestion(
    Question(
      id: "1",
      question:
          "Who developed the Flutter Framework and continues to maintain it today?",
      options: {
        'Facebook': false,
        'Microsoft': false,
        'Google': true,
        'Oracle': false,
      },
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'QuizAss',
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
