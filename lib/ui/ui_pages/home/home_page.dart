import 'package:flutter/material.dart';
import 'feature_card.dart';

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
              icon: const Icon(Icons.quiz, size: 24),
              label: Text(
                'Start Quiz',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Text(
                'Flavor: $flavor',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  FeatureCard(
                    icon: Icons.style,
                    title: 'Manage Flashcards',
                    subtitle: 'Create, edit, and organize your study materials',
                    onTap: () {
                      Navigator.pushNamed(context, '/flashcard-management');
                    },
                  ),
                  const SizedBox(height: 16),
                  FeatureCard(
                    icon: Icons.analytics,
                    title: 'View Progress',
                    subtitle: 'Track your learning progress and performance',
                    onTap: () {
                      // Navigate to progress page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 