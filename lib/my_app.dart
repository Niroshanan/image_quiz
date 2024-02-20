import 'package:flutter/material.dart';
import 'package:image_quiz/models/quiz_model.dart';
import 'package:image_quiz/widgets/answer_chices.dart';
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

  @override
  void initState() {
    super.initState();
    futureQuiz = fetchQuiz();
  }

  void onSubmitPressed(String selectedAnswer) {
    futureQuiz.then((quizModel) {
      if (selectedAnswer == quizModel.solution.toString()) {
      } else {
        // The selected answer is incorrect
        print('Incorrect answer!');
        // Perform any actions you want for an incorrect answer
      }
    }).catchError((error) {
      // Handle any errors that occur during fetching quiz data
      print("Error fetching quiz: $error");
    });
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
      appBar: const CustomAppBar(
        height: 150,
        child: TopBar(),
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
          child: Column(children: [
            TimerWidget(
              timerController: timerController,
            ),
            FutureBuilder(
              future: futureQuiz,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  timerController.start();
                  return Image.network(snapshot.data!.question);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: AnswerChoices(
                onSubmitPressed: onSubmitPressed,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
