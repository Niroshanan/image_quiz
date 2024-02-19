import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(children: [
          Icon(Icons.timer),
          
        ]),
      ),
    );
  }
}
