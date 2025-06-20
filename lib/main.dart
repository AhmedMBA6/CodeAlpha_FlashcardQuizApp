import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ui/ui_pages/flashcard_management_page.dart';

const MaterialColor kAppPurple = MaterialColor(
  0xFF7B3FE4, // Main purple color from the logo
  <int, Color>{
    50: Color(0xFFF2E9FB),
    100: Color(0xFFD9C8F3),
    200: Color(0xFFBFA3EA),
    300: Color(0xFFA57EE1),
    400: Color(0xFF9163DA),
    500: Color(0xFF7B3FE4), // Main
    600: Color(0xFF7339D1),
    700: Color(0xFF682FC0),
    800: Color(0xFF5E27B0),
    900: Color(0xFF4B1893),
  },
);

void main({String flavor = 'prod'}) {
  runApp(MyApp(flavor: flavor));
}

class MyApp extends StatelessWidget {
  final String flavor;
  const MyApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.robotoTextTheme(
      Theme.of(context).textTheme.copyWith(
        titleLarge: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        bodyMedium: const TextStyle(fontSize: 15),
      ),
    );
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: kAppPurple,
        textTheme: textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: kAppPurple,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kAppPurple,
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: kAppPurple).copyWith(
          secondary: kAppPurple.shade200,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: kAppPurple,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primarySwatch: kAppPurple,
        ).copyWith(
          secondary: kAppPurple.shade200,
        ),
        textTheme: textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: kAppPurple,
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kAppPurple,
        ),
      ),
      themeMode: ThemeMode.system,
      home: MainNavigation(flavor: flavor),
    );
  }
}

class MainNavigation extends StatefulWidget {
  final String flavor;
  const MainNavigation({Key? key, required this.flavor}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    FlashcardManagementPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final flavor = (context.findAncestorWidgetOfExactType<MainNavigation>()?.flavor) ?? 'prod';
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              // TODO: Navigate to settings page
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to Flashcard Quiz!'),
            const SizedBox(height: 8),
            Text('Flavor: $flavor'),
          ],
        ),
      ),
    );
  }
}
