import 'package:flutter/material.dart';
import '../../app_core/navigation/routes.dart';

class HomePage extends StatelessWidget {
  final String flavor;
  const HomePage({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              // TODO: Navigate to settings page
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.quiz),
              label: const Text('Start Quiz'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: Theme.of(context).textTheme.titleLarge,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.quiz);
              },
            ),
            const SizedBox(height: 24),
            Text('Flavor: $flavor'),
          ],
        ),
      ),
    );
  }
} 