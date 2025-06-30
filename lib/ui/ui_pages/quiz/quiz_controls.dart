import 'package:flutter/material.dart';

class QuizNavigationControls extends StatelessWidget {
  final VoidCallback onCorrect;
  final VoidCallback onIncorrect;
  const QuizNavigationControls({super.key, required this.onCorrect, required this.onIncorrect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: onIncorrect,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Incorrect'),
          ),
          ElevatedButton(
            onPressed: onCorrect,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('Correct'),
          ),
        ],
      ),
    );
  }
} 