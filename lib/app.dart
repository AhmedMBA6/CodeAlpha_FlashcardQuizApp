import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_core/theme/app_theme_manager.dart';
import 'app_core/di/service_locator.dart';
import 'app_core/navigation/app_router.dart';
import 'ui/ui_pages/main_navigation.dart';

/// Main application widget
class FlashcardQuizApp extends StatefulWidget {
  final String flavor;
  const FlashcardQuizApp({super.key, required this.flavor});

  @override
  State<FlashcardQuizApp> createState() => _FlashcardQuizAppState();
}

class _FlashcardQuizAppState extends State<FlashcardQuizApp> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  /// Initialize app dependencies and services
  Future<void> _initializeApp() async {
    // Initialize dependency injection
    await ServiceLocator.init();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flashcard Quiz App',
          debugShowCheckedModeBanner: false,
          theme: AppThemeManager.lightTheme,
          darkTheme: AppThemeManager.darkTheme,
          themeMode: AppThemeManager.defaultThemeMode,
          home: MainNavigation(flavor: widget.flavor),
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose dependencies when app is closed
    ServiceLocator.dispose();
    super.dispose();
  }
} 