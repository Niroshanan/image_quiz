import 'package:flutter/material.dart';
import 'package:linear_timer/linear_timer.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key, required this.timerController});

  final LinearTimerController timerController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            const Icon(Icons.timer),
            Expanded(
              child: LinearTimer(
                forward: false,
                minHeight: 10,
                duration: const Duration(seconds: 30),
                controller: timerController,
                color: Colors.blue,
                onTimerEnd: () {},
              ),
            )
          ]),
          const Text('Time Remaining'),
        ],
      ),
    );
  }
}
