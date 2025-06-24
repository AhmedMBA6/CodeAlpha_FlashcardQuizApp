import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../../../business_logic/business_logic_entities/flashcard.dart';

class FlashcardView extends StatelessWidget {
  final Flashcard flashcard;
  const FlashcardView({super.key, required this.flashcard});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      front: FlashcardContent(text: flashcard.question),
      back: FlashcardContent(text: flashcard.answer),
    );
  }
}

class FlashcardContent extends StatelessWidget {
  final String text;
  const FlashcardContent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
} 