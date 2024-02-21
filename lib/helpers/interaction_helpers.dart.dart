import 'package:flutter/material.dart';

void exitConfirmation(
  BuildContext context,
) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Are you sure you want to leave this page?'),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}

void showSnackBar(BuildContext context, String message , bool isCorrect) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      content: Text(message),
      duration: const Duration(seconds: 2),
    ),
  );
}
