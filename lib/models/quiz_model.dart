import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<QuizModel> fetchQuiz() async {
  final response =
      await http.get(Uri.parse('https://marcconrad.com/uob/smile/api.php'));

  if (response.statusCode == 200) {
    return QuizModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load from API.');
  }
}

class QuizModel {
  final String question;
  final int solution;

  const QuizModel({
    required this.question,
    required this.solution,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'question': String question,
        'solution': int solution,
      } =>
        QuizModel(
          question: question,
          solution: solution,
        ),
      _ => throw const FormatException('Failed to load.'),
    };
  }
}
