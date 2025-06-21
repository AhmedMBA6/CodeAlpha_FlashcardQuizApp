import 'package:flutter/material.dart';
import 'package:codealpha_flashcard_quiz_app/ui/ui_pages/flashcard_management_page.dart';
import 'package:codealpha_flashcard_quiz_app/ui/ui_pages/quiz_page.dart';
import 'package:codealpha_flashcard_quiz_app/ui/ui_pages/results_screen.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.flashcardManagement:
        return MaterialPageRoute(builder: (_) => const FlashcardManagementPage());
      case AppRoutes.quiz:
        return MaterialPageRoute(builder: (_) => const QuizPage());
      case AppRoutes.quizResults:
        final args = settings.arguments as Map<String, int>;
        final score = args['score']!;
        final total = args['total']!;
        return MaterialPageRoute(
            builder: (_) => ResultsScreen(score: score, total: total));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
} 