import 'package:codealpha_flashcard_quiz_app/app_core/navigation/app_router.dart';
import 'package:codealpha_flashcard_quiz_app/app_core/theme/app_colors.dart';
import 'package:codealpha_flashcard_quiz_app/ui/ui_pages/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    final themeData = ThemeData(
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
    );

    final darkThemeData = ThemeData.dark().copyWith(
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
    );

    return MaterialApp(
      // Show debug banner only in development
      debugShowCheckedModeBanner: flavor == 'dev',
      theme: themeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.system,
      home: MainNavigation(flavor: flavor),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
} 