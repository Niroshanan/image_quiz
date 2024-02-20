import 'package:flutter/material.dart';
import 'package:image_quiz/my_app.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void startquiz(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 129, 4, 148),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => startquiz(context),
              child: const Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
