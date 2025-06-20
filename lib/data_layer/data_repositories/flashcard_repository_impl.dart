import 'package:codealpha_flashcard_quiz_app/business_logic/business_logic_entities/flashcard.dart';
import 'package:codealpha_flashcard_quiz_app/business_logic/business_logic_repositories/flashcard_repository.dart';

class FlashcardRepositoryImpl implements FlashcardRepository {
  final List<Flashcard> _flashcards = [];

  @override
  Future<List<Flashcard>> getAllFlashcards() async {
    return _flashcards;
  }

  @override
  Future<void> addFlashcard(Flashcard flashcard) async {
    _flashcards.add(flashcard);
  }

  @override
  Future<void> updateFlashcard(int index, Flashcard flashcard) async {
    if (index >= 0 && index < _flashcards.length) {
      _flashcards[index] = flashcard;
    }
  }

  @override
  Future<void> deleteFlashcard(int index) async {
    if (index >= 0 && index < _flashcards.length) {
      _flashcards.removeAt(index);
    }
  }
} 