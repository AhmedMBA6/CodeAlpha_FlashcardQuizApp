import 'package:flutter/material.dart';
import '../../../business_logic/business_logic_entities/flashcard.dart';

class FlashcardCard extends StatelessWidget {
  final Flashcard card;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const FlashcardCard({
    super.key,
    required this.card,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        title: Text(
          card.question,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          card.answer,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit',
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Delete',
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
} 