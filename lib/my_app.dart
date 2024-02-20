import 'package:flutter/material.dart';
import 'package:image_quiz/models/quiz_model.dart';
import 'package:image_quiz/widgets/key_pad.dart';
import 'package:image_quiz/widgets/my_app_bar.dart';
import 'package:image_quiz/widgets/timer_widget.dart';
import 'package:image_quiz/widgets/topbar.dart';
import 'package:linear_timer/linear_timer.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late Future<QuizModel> futureQuiz;
  late LinearTimerController timerController = LinearTimerController(this);
  Duration duration = const Duration(seconds: 10);
  bool _isImageUrlSet = false;
  late String _imageUrl;
  late int _solution;
  int _score = 0;
  int _questionNumber = 0;

  @override
  void initState() {
    super.initState();
    _startQuiz();
  }

  void _startQuiz() {
    futureQuiz = fetchQuiz();
    futureQuiz.then((value) {
      setState(() {
        _isImageUrlSet = true;
        _imageUrl = value.question;
        _solution = value.solution;
      });
    });
  }

  void checkAnswer(String selectedAnswer) {
    if (selectedAnswer == _solution.toString()) {
      timerController.stop();
      timerController.reset();
      _score++;
    }
    _questionNumber++;
    _startQuiz();
  }

  @override
  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 129, 4, 148),
      appBar: CustomAppBar(
        height: 150,
        child: TopBar(questionNumber: _questionNumber, score: _score),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 129, 4, 148),
                Color.fromARGB(255, 78, 9, 156),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              TimerWidget(
                timerController: timerController,
                duration: duration,
              ),
              SizedBox(
                height: 200,
                child: _isImageUrlSet
                    ? Image.network(
                        _imageUrl,
                        fit: BoxFit.scaleDown,
                      )
                    : const LinearProgressIndicator(
                        color: Color.fromARGB(255, 233, 176, 243),
                      ),
              ),
              
              Expanded(
                child: KeyPad(onSubmitPressed: checkAnswer),
              )
            ],
          ),
        ),
      ),
    );
  }
}
