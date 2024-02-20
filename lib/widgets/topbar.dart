import 'dart:io';

import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(101, 255, 255, 255),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Transform.rotate(
                    angle: 3.14,
                    child: IconButton(
                      onPressed: () {
                        exit(1);
                      },
                      icon: const Icon(Icons.exit_to_app),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quiz No: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Score: ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
