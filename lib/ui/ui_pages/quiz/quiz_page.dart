import 'package:flutter/material.dart';
import '../../../app_core/navigation/routes.dart';
import '../../../business_logic/business_logic_entities/flashcard.dart';
import '../../../data_layer/data_repositories/flashcard_repository_impl.dart';
import '../../../business_logic/business_logic_usecases/flashcard_usecases.dart';
import 'quiz_card.dart';
import 'quiz_controls.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _repository = FlashcardRepositoryImpl.instance;
  late final GetAllFlashcards _getAll;
  final PageController _pageController = PageController();
  List<Flashcard> _flashcards = [];
  List<Flashcard> _studyDeck = [];
  int _currentIndex = 0;
  bool _isLoading = true;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _getAll = GetAllFlashcards(_repository);
    _loadFlashcards();
    _pageController.addListener(() {
      if (_pageController.page?.round() != _currentIndex) {
        setState(() {
          _currentIndex = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadFlashcards() async {
    final cards = await _getAll();
    setState(() {
      _flashcards = cards;
      _studyDeck = List.from(_flashcards);
      _isLoading = false;
    });
  }

  void _shuffleDeck() {
    setState(() {
      _studyDeck.shuffle();
      _score = 0;
      _pageController.jumpToPage(0);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Deck shuffled!'), duration: Duration(seconds: 1)),
    );
  }

  void _markAnswer(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        _score++;
      });
    }
    if (_currentIndex < _studyDeck.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.quizResults,
        arguments: {'score': _score, 'total': _studyDeck.length},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_studyDeck.isEmpty ? 'Quiz Mode' : 'Card ${_currentIndex + 1} of ${_studyDeck.length}'),
        actions: [
          if (_studyDeck.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.shuffle),
              tooltip: 'Shuffle Deck',
              onPressed: _shuffleDeck,
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _studyDeck.isEmpty
              ? const Center(child: Text('No flashcards available to study.'))
              : Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _studyDeck.length,
                        itemBuilder: (context, index) {
                          final flashcard = _studyDeck[index];
                          return FlashcardView(flashcard: flashcard);
                        },
                      ),
                    ),
                    QuizNavigationControls(
                      onCorrect: () => _markAnswer(true),
                      onIncorrect: () => _markAnswer(false),
                    ),
                  ],
                ),
    );
  }
} 