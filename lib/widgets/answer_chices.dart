import 'package:flutter/material.dart';

class AnswerChoices extends StatefulWidget {
  const AnswerChoices({super.key, required this.onSubmitPressed});

  final void Function(String answer) onSubmitPressed;
  @override
  State<StatefulWidget> createState() {
    return _AnswerChoicesState();
  }
}

class _AnswerChoicesState extends State<AnswerChoices> {
  var _selectedAnswer;

  void answerQuestion() {
    widget.onSubmitPressed(_selectedAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(55, 255, 255, 255),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildButtonRow(['1', '2', '3']),
            _buildButtonRow(['4', '5', '6']),
            _buildButtonRow(['7', '8', '9']),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 18), // Add some space to align "0" button
                createButton('0'),
                const SizedBox(width: 34),
                TextButton(
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
                      const Size(164, 40),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  onPressed: (){
                    answerQuestion();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttonLabels) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttonLabels.map((label) {
        return createButton(label);
      }).toList(),
    );
  }

  Widget createButton(String label) {
    bool isSelected = _selectedAnswer == label;
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.grey;
          }

          return isSelected ? Colors.blue : Colors.white;
        }),
        fixedSize: MaterialStateProperty.all(
          const Size(40, 40),
        ),
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
        setState(() {
          _selectedAnswer = label;
        });
      },
      child: Text(label),
    );
  }
}
