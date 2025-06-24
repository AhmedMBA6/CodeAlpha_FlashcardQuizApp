import 'package:flutter/material.dart';
import '../../../business_logic/business_logic_entities/flashcard.dart';

Future<Flashcard?> showFlashcardDialog({
  required BuildContext context,
  Flashcard? initial,
}) {
  final questionController = TextEditingController(text: initial?.question ?? '');
  final answerController = TextEditingController(text: initial?.answer ?? '');
  String? errorText;

  return showDialog<Flashcard>(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(initial == null ? 'Add Flashcard' : 'Edit Flashcard'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: questionController,
                decoration: const InputDecoration(
                  labelText: 'Question',
                  hintText: 'Enter the question',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: answerController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Answer',
                  hintText: 'Enter the answer',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              if (errorText != null) ...[
                const SizedBox(height: 16),
                Text(errorText!, style: const TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 16),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final question = questionController.text.trim();
                final answer = answerController.text.trim();
                if (question.isEmpty || answer.isEmpty) {
                  setState(() => errorText = 'Both fields are required.');
                  return;
                }
                Navigator.of(context).pop(Flashcard(question: question, answer: answer));
              },
              child: Text(initial == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      );
    },
  );
} 