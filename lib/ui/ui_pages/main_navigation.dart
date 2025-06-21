import 'package:codealpha_flashcard_quiz_app/ui/ui_pages/flashcard_management_page.dart';
import 'package:codealpha_flashcard_quiz_app/ui/ui_pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../app_core/theme/app_colors.dart';

class MainNavigation extends StatefulWidget {
  final String flavor;
  const MainNavigation({Key? key, required this.flavor}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(flavor: widget.flavor),
      const FlashcardManagementPage(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.style),
            label: 'Flashcards',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kAppPurple,
        onTap: _onItemTapped,
      ),
    );
  }
} 