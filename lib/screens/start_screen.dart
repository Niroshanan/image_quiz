import 'dart:io';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  void startquiz(BuildContext context) {
    Navigator.of(context).pushNamed('/quiz_screen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 124, 90, 248),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/logo.jpg',
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => startquiz(context),
              child: const Text('Start Quiz'),
            ),
            ElevatedButton(
              onPressed: () {
                exit(1);
              },
              child: const Text('Exit'),
            )
          ],
        ),
      ),
    );
  }
}
