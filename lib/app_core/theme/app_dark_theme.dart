import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';
import '../utils/screen_utils.dart';

/// Dark theme configuration for the app
class AppDarkTheme {
  /// Creates the dark theme data
  static ThemeData get themeData {
    return ThemeData(
      // Use Material 3 design
      useMaterial3: true,
      
      // Primary color scheme
      primarySwatch: kAppPurple,
      primaryColor: kAppPurple,
      
      // Color scheme
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: kAppPurple,
        brightness: Brightness.dark,
      ).copyWith(
        secondary: kAppPurple.shade200,
        surface: const Color(0xFF1E1E1E),
        error: Colors.red[400],
        onSurface: Colors.white,
      ),
      
      // Text theme
      textTheme: AppTextTheme.darkTextTheme,
      
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextTheme.darkTextTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      
      // Card theme
      cardTheme: CardThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.getRadius(12)),
        ),
        color: const Color(0xFF2C2C2C),
        shadowColor: Colors.black.withValues(alpha: 0.3),
      ),
      
      // Elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kAppPurple,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: ScreenUtils.getPadding(
            horizontal: 24,
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtils.getRadius(8)),
          ),
          textStyle: AppTextTheme.darkTextTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kAppPurple,
        foregroundColor: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.getRadius(16)),
        ),
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.getRadius(8)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.getRadius(8)),
          borderSide: BorderSide(color: kAppPurple, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.getRadius(8)),
          borderSide: BorderSide(color: Colors.red[400]!, width: 2),
        ),
        contentPadding: ScreenUtils.getPadding(
          horizontal: 16,
          vertical: 12,
        ),
        labelStyle: AppTextTheme.darkTextTheme.bodyMedium?.copyWith(
          color: Colors.grey[400],
        ),
      ),
      
      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: kAppPurple,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      // Icon theme
      iconTheme: IconThemeData(
        color: kAppPurple,
        size: ScreenUtils.getWidth(24),
      ),
      
      // Divider theme
      dividerTheme: DividerThemeData(
        color: Colors.grey[700],
        thickness: 1,
        space: 1,
      ),
      
      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF2C2C2C),
        contentTextStyle: AppTextTheme.darkTextTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.getRadius(8)),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      
      // Scaffold background color
      scaffoldBackgroundColor: const Color(0xFF121212),
    );
  }
} 