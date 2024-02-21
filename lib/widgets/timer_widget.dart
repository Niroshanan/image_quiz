import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
    required this.duration,
    required this.timeRemaining,
  });
  final int timeRemaining;
  final int duration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            const Icon(
              Icons.timer,
              color: Colors.white,
            ),
            Expanded(
              child: LinearProgressIndicator(
                value: timeRemaining / duration,
                backgroundColor: Colors.white,
                color: timeRemaining < 10 ? Colors.red : Colors.blue,
                minHeight: 10.0,
              ),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Time Remaining: $timeRemaining s',
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
