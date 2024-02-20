import 'package:flutter/material.dart';
import 'package:image_quiz/widgets/single_button.dart';

class KeyPad extends StatefulWidget {
  const KeyPad({super.key, required this.onSubmitPressed});
  final void Function(String answer) onSubmitPressed;

  @override
  State<StatefulWidget> createState() {
    return _KeyPadState();
  }
}

class _KeyPadState extends State<KeyPad> {
  var _selectedAnswer = '';
  void _onButtonPressed(String label) {
    setState(() {
      _selectedAnswer = label;
    });
  }

  Widget _buildButtonRow(List<String> buttonLabels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttonLabels.map((label) {
        return SignleButton(
            label: label,
            onPressed: _onButtonPressed,
            selectedAnswer: _selectedAnswer);
      }).toList(),
    );
  }

  void submitAnswer() {
    widget.onSubmitPressed(_selectedAnswer);
    _selectedAnswer = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildButtonRow(['1', '2', '3']),
        _buildButtonRow(['4', '5', '6']),
        _buildButtonRow(['7', '8', '9']),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 20),
            SignleButton(
                label: '0',
                onPressed: _onButtonPressed,
                selectedAnswer: _selectedAnswer),
            const SizedBox(width: 35),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 216, 7, 216)),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  textStyle: MaterialStateProperty.all(
                    const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  fixedSize: MaterialStateProperty.all(
                    const Size(80, 80),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: submitAnswer,
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(width: 20),
          ],
        )
      ],
    );
  }
}
