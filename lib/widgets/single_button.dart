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
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.purple, width: 3),
          backgroundColor: isSelected ? Colors.green : Colors.white,
          fixedSize: const Size(80, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          textStyle: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )),
      onPressed: () {
        onPressed(label);
      },
      child: Text(label),
    );
  }
}
