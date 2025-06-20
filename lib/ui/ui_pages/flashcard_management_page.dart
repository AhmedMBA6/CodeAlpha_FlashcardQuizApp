import 'package:flutter/material.dart';
import '../../business_logic/business_logic_entities/flashcard.dart';
import '../../data_layer/data_repositories/flashcard_repository_impl.dart';
import '../../business_logic/business_logic_usecases/flashcard_usecases.dart';

class FlashcardManagementPage extends StatefulWidget {
  const FlashcardManagementPage({super.key});

  @override
  State<FlashcardManagementPage> createState() => _FlashcardManagementPageState();
}

class _FlashcardManagementPageState extends State<FlashcardManagementPage> {
  final _repository = FlashcardRepositoryImpl();
  late final GetAllFlashcards _getAll;
  late final AddFlashcard _add;
  late final UpdateFlashcard _update;
  late final DeleteFlashcard _delete;

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<Flashcard> _flashcards = [];

  @override
  void initState() {
    super.initState();
    _getAll = GetAllFlashcards(_repository);
    _add = AddFlashcard(_repository);
    _update = UpdateFlashcard(_repository);
    _delete = DeleteFlashcard(_repository);
    _loadFlashcards();
  }

  Future<void> _loadFlashcards() async {
    final cards = await _getAll();
    setState(() {
      _flashcards = List.from(cards);
    });
  }

  Future<void> _showFlashcardDialog({Flashcard? flashcard, int? index}) async {
    final questionController = TextEditingController(text: flashcard?.question ?? '');
    final answerController = TextEditingController(text: flashcard?.answer ?? '');
    final isEditing = flashcard != null && index != null;
    String? errorText;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          titlePadding: const EdgeInsets.only(left: 24, right: 8, top: 24, bottom: 0),
          contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(isEditing ? 'Edit Flashcard' : 'Add Flashcard'),
              IconButton(
                icon: const Icon(Icons.close),
                tooltip: 'Close',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: questionController,
                decoration: const InputDecoration(labelText: 'Question'),
              ),
              TextField(
                controller: answerController,
                decoration: const InputDecoration(labelText: 'Answer'),
              ),
              if (errorText != null) ...[
                const SizedBox(height: 12),
                Text(errorText ?? '', style: const TextStyle(color: Colors.red)),
              ],
            ],
          ),
          actionsPadding: const EdgeInsets.only(right: 16, bottom: 12),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final question = questionController.text.trim();
                final answer = answerController.text.trim();
                if (question.isEmpty || answer.isEmpty) {
                  setState(() {
                    errorText = 'Both fields are required.';
                  });
                  return;
                }
                if (isEditing) {
                  await _update(index!, Flashcard(question: question, answer: answer));
                  setState(() {
                    _flashcards[index] = Flashcard(question: question, answer: answer);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Flashcard updated!')),
                  );
                } else {
                  await _add(Flashcard(question: question, answer: answer));
                  setState(() {
                    _flashcards.insert(0, Flashcard(question: question, answer: answer));
                    _listKey.currentState?.insertItem(0);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Flashcard added!')),
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text(isEditing ? 'Update' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmDelete(int index) async {
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
      final removedCard = _flashcards.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildCard(removedCard, index, animation),
        duration: const Duration(milliseconds: 400),
      );
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Flashcard deleted!')),
      );
    }
  }

  Widget _buildCard(Flashcard card, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(bottom: 16),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
              Semantics(
                label: 'Edit flashcard',
                hint: 'Tap to edit this flashcard',
                child: IconButton(
                  icon: const Icon(Icons.edit),
                  constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                  onPressed: () => _showFlashcardDialog(flashcard: card, index: index),
                ),
              ),
              Semantics(
                label: 'Delete flashcard',
                hint: 'Tap to delete this flashcard',
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  constraints: const BoxConstraints(minWidth: 48, minHeight: 48),
                  onPressed: () => _confirmDelete(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.style),
        title: Text(
          'Flashcard Management',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
      ),
      body: _flashcards.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Semantics(
                    label: 'No flashcards icon',
                    child: Icon(Icons.style, size: 64, color: Theme.of(context).colorScheme.primary),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'No flashcards yet!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap the add button to add your first flashcard.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          : AnimatedList(
              key: _listKey,
              padding: const EdgeInsets.all(16),
              initialItemCount: _flashcards.length,
              itemBuilder: (context, index, animation) {
                final card = _flashcards[index];
                return Semantics(
                  label: 'Flashcard: ${card.question}',
                  hint: 'Double tap to edit. Swipe left or right for more options.',
                  child: _buildCard(card, index, animation),
                );
              },
            ),
      floatingActionButton: Semantics(
        label: 'Add flashcard',
        hint: 'Tap to add a new flashcard',
        child: FloatingActionButton(
          onPressed: () => _showFlashcardDialog(),
          tooltip: 'Add Flashcard',
          child: const Icon(Icons.note_add),
        ),
      ),
    );
  }
} 