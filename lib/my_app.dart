import 'package:flutter/material.dart';
import 'package:image_quiz/widgets/topbar.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My App',
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              TopBar(),
              Text('Timer'),
              Text('Quiz Question'),
              Text('Answer Choices'),
            ]
          ),
        ),
      ),
    );
  }
}
