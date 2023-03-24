import 'package:http/http.dart' as http;
import 'dart:convert';

import '/models/question.dart';

class DBConn {
  Future<void> addQuestion(Question question) async {
    http.post(
        Uri.parse(
            'https://quizass-7acfc-default-rtdb.firebaseio.com/question.json'),
        body: json.encode({
          'question': question.question,
          'answers': question.options,
        }));
  }

  Future<void> getQuestion(Question question) async {
    http
        .get(
      Uri.parse(
          'https://quizass-7acfc-default-rtdb.firebaseio.com/question.json'),
    )
        .then((res) {
      var data = json.decode(res.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];

      data.forEach((key, value) {
        var newQuestion = Question(
            id: key,
            question: value["question"],
            options: Map.castFrom(value['answers']));
        newQuestions.add(newQuestion);
      });
      print(newQuestions);
    });
  }
}
