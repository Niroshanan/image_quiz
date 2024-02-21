import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.totalQuestions,
    required this.score,
  }) : super(key: key);

  final int totalQuestions;
  final int score;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildText('Time is up!', isBold: true),
        _buildText('Total Questions: $totalQuestions'),
        _buildText('Score: $score'),
      ],
    );
  }

  Widget _buildText(String text, {bool isBold = false}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
