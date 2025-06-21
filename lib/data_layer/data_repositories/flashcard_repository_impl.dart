import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:codealpha_flashcard_quiz_app/business_logic/business_logic_entities/flashcard.dart';
import 'package:codealpha_flashcard_quiz_app/business_logic/business_logic_repositories/flashcard_repository.dart';
import '../data_models/flashcard_model.dart';

class FlashcardRepositoryImpl implements FlashcardRepository {
  // Private constructor
  FlashcardRepositoryImpl._();
  // Static instance
  static final FlashcardRepositoryImpl instance = FlashcardRepositoryImpl._();

  static const _flashcardsKey = 'flashcards';

  Future<SharedPreferences> _getPrefs() async {
    return SharedPreferences.getInstance();
  }

  Future<void> _saveFlashcards(List<FlashcardModel> flashcards) async {
    final prefs = await _getPrefs();
    final flashcardsJson = flashcards.map((card) => card.toJson()).toList();
    await prefs.setString(_flashcardsKey, json.encode(flashcardsJson));
  }

  @override
  Future<List<Flashcard>> getAllFlashcards() async {
    final prefs = await _getPrefs();
    final flashcardsString = prefs.getString(_flashcardsKey);
    if (flashcardsString == null) {
      return [];
    }
    final List<dynamic> flashcardsJson = json.decode(flashcardsString);
    return flashcardsJson.map((json) => FlashcardModel.fromJson(json)).toList();
  }

  @override
  Future<void> addFlashcard(Flashcard flashcard) async {
    final flashcards = await getAllFlashcards();
    final newFlashcards = List<FlashcardModel>.from(flashcards.map((e) => FlashcardModel(question: e.question, answer: e.answer)));
    newFlashcards.add(FlashcardModel(question: flashcard.question, answer: flashcard.answer));
    await _saveFlashcards(newFlashcards);
  }

  @override
  Future<void> updateFlashcard(int index, Flashcard flashcard) async {
    final flashcards = await getAllFlashcards();
    final newFlashcards = List<FlashcardModel>.from(flashcards.map((e) => FlashcardModel(question: e.question, answer: e.answer)));
    if (index >= 0 && index < newFlashcards.length) {
      newFlashcards[index] = FlashcardModel(question: flashcard.question, answer: flashcard.answer);
      await _saveFlashcards(newFlashcards);
    }
  }

  @override
  Future<void> deleteFlashcard(int index) async {
    final flashcards = await getAllFlashcards();
    final newFlashcards = List<FlashcardModel>.from(flashcards.map((e) => FlashcardModel(question: e.question, answer: e.answer)));
    if (index >= 0 && index < newFlashcards.length) {
      newFlashcards.removeAt(index);
      await _saveFlashcards(newFlashcards);
    }
  }
} 