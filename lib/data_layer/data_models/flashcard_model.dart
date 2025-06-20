import 'dart:convert';
import '../../business_logic/business_logic_entities/flashcard.dart';

class FlashcardModel extends Flashcard {
  FlashcardModel({
    required super.question,
    required super.answer,
  });

  factory FlashcardModel.fromJson(Map<String, dynamic> json) {
    return FlashcardModel(
      question: json['question'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
  }
} 