import 'package:flutter/material.dart';
import '../../../business_logic/business_logic_entities/flashcard.dart';
import '../../../business_logic/business_logic_usecases/flashcard_usecases.dart';
import '../../../app_core/di/service_locator.dart';
import 'flashcard_list.dart';
import 'flashcard_dialog.dart';

class FlashcardManagementPage extends StatefulWidget {
  const FlashcardManagementPage({super.key});

  @override
  State<FlashcardManagementPage> createState() => _FlashcardManagementPageState();
}

class _FlashcardManagementPageState extends State<FlashcardManagementPage> {
  late final GetAllFlashcards _getAll;
  late final AddFlashcard _add;
  late final UpdateFlashcard _update;
  late final DeleteFlashcard _delete;

  List<Flashcard> _flashcards = [];

  @override
  void initState() {
    super.initState();
    _getAll = serviceLocator<GetAllFlashcards>();
    _add = serviceLocator<AddFlashcard>();
    _update = serviceLocator<UpdateFlashcard>();
    _delete = serviceLocator<DeleteFlashcard>();
    _loadFlashcards();
  }

  Future<void> _loadFlashcards() async {
    final cards = await _getAll();
    setState(() {
      _flashcards = List.from(cards);
    });
  }

  Future<void> _addFlashcard() async {
    final newCard = await showFlashcardDialog(context: context);
    if (newCard != null) {
      await _add(newCard);
      await _loadFlashcards();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Flashcard added!')));
    }
  }

  Future<void> _editFlashcard(int index) async {
    final updatedCard = await showFlashcardDialog(context: context, initial: _flashcards[index]);
    if (updatedCard != null) {
      await _update(index, updatedCard);
      await _loadFlashcards();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Flashcard updated!')));
    }
  }

  Future<void> _deleteFlashcard(int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Flashcard'),
        content: const Text('Are you sure you want to delete this flashcard?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await _delete(index);
      await _loadFlashcards();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Flashcard deleted!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.style),
        title: Text('Flashcard Management', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
      ),
      body: FlashcardList(
        flashcards: _flashcards,
        onEdit: _editFlashcard,
        onDelete: _deleteFlashcard,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addFlashcard,
        tooltip: 'Add Flashcard',
        child: const Icon(Icons.note_add),
      ),
    );
  }
} 