import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';
import '../utils/screen_utils.dart';

/// Light theme configuration for the app
class AppLightTheme {
  /// Creates the light theme data
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
        brightness: Brightness.light,
      ).copyWith(
        secondary: kAppPurple.shade200,
        surface: Colors.white,
        error: Colors.red[700],
      ),
      
      // Text theme
      textTheme: AppTextTheme.textTheme,
      
      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: kAppPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextTheme.textTheme.titleLarge?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      
      // Card theme
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.getRadius(12)),
        ),
        color: Colors.white,
        shadowColor: Colors.black.withValues(alpha: 0.1),
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
          textStyle: AppTextTheme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Floating action button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kAppPurple,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.getRadius(16)),
        ),
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[100],
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
          borderSide: BorderSide(color: Colors.red[700]!, width: 2),
        ),
        contentPadding: ScreenUtils.getPadding(
          horizontal: 16,
          vertical: 12,
        ),
        labelStyle: AppTextTheme.textTheme.bodyMedium?.copyWith(
          color: Colors.grey[600],
        ),
      ),
      
      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: kAppPurple,
        unselectedItemColor: Colors.grey[600],
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
        color: Colors.grey[300],
        thickness: 1,
        space: 1,
      ),
      
      // Snackbar theme
      snackBarTheme: SnackBarThemeData(
        backgroundColor: Colors.grey[800],
        contentTextStyle: AppTextTheme.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenUtils.getRadius(8)),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
} 