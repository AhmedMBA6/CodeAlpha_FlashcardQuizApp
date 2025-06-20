import '../business_logic_entities/flashcard.dart';

abstract class FlashcardRepository {
  Future<List<Flashcard>> getAllFlashcards();
  Future<void> addFlashcard(Flashcard flashcard);
  Future<void> updateFlashcard(int index, Flashcard flashcard);
  Future<void> deleteFlashcard(int index);
} 