import '../business_logic_entities/flashcard.dart';
import '../business_logic_repositories/flashcard_repository.dart';

class GetAllFlashcards {
  final FlashcardRepository repository;
  GetAllFlashcards(this.repository);

  Future<List<Flashcard>> call() async {
    return await repository.getAllFlashcards();
  }
}

class AddFlashcard {
  final FlashcardRepository repository;
  AddFlashcard(this.repository);

  Future<void> call(Flashcard flashcard) async {
    await repository.addFlashcard(flashcard);
  }
}

class UpdateFlashcard {
  final FlashcardRepository repository;
  UpdateFlashcard(this.repository);

  Future<void> call(int index, Flashcard flashcard) async {
    await repository.updateFlashcard(index, flashcard);
  }
}

class DeleteFlashcard {
  final FlashcardRepository repository;
  DeleteFlashcard(this.repository);

  Future<void> call(int index) async {
    await repository.deleteFlashcard(index);
  }
} 