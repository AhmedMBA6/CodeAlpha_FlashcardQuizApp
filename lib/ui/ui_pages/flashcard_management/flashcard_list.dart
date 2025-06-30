import 'package:flutter/material.dart';
import '../../../business_logic/business_logic_entities/flashcard.dart';
import 'flashcard_card.dart';

class FlashcardList extends StatelessWidget {
  final List<Flashcard> flashcards;
  final void Function(int) onEdit;
  final void Function(int) onDelete;

  const FlashcardList({
    super.key,
    required this.flashcards,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (flashcards.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.style, size: 64, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text('No flashcards yet!', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Tap the add button to add your first flashcard.', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: flashcards.length,
      itemBuilder: (context, index) {
        final card = flashcards[index];
        return FlashcardCard(
          card: card,
          onEdit: () => onEdit(index),
          onDelete: () => onDelete(index),
        );
      },
    );
  }
} 