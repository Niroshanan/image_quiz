import 'package:flutter/material.dart';

class SignleButton extends StatelessWidget {
  const SignleButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.selectedAnswer,
  });
  final String label;
  final void Function(String answer) onPressed;
  final String selectedAnswer;

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedAnswer == label;
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue;
          }
          // return Colors.green;
          return isSelected ? Colors.blue : Colors.white;
        }),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      onPressed: () {
        onPressed(label);
      },
      child: Text(label),
    );
  }
}
