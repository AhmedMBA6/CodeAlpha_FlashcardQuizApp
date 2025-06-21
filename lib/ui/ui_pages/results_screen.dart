import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultsScreen({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    final double percentage = total > 0 ? (score / total) * 100 : 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            Text(
              '$score / $total',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${percentage.toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: percentage > 70 ? Colors.green : Colors.orange,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
} 