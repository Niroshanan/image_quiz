import 'package:flutter/material.dart';
import 'package:image_quiz/screens/my_app.dart';
import 'package:image_quiz/screens/start_screen.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/start_screen',
    routes: <String, WidgetBuilder>{
      '/start_screen': (BuildContext context) => const StartScreen(),
      '/quiz_screen': (BuildContext context) => const MyApp(),
    },
  ));
}
