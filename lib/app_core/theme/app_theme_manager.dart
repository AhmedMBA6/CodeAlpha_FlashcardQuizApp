import 'package:flutter/material.dart';
import 'app_light_theme.dart';
import 'app_dark_theme.dart';

/// Theme manager for the app
/// Provides easy access to light and dark themes
class AppThemeManager {
  /// Get the light theme
  static ThemeData get lightTheme => AppLightTheme.themeData;
  
  /// Get the dark theme
  static ThemeData get darkTheme => AppDarkTheme.themeData;
  
  /// Get the default theme mode (system)
  static ThemeMode get defaultThemeMode => ThemeMode.system;
  
  /// Get theme mode from string
  static ThemeMode getThemeModeFromString(String themeMode) {
    switch (themeMode.toLowerCase()) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
  
  /// Get string from theme mode
  static String getStringFromThemeMode(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
  
  /// Check if the current theme is dark
  static bool isDarkTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
  
  /// Check if the current theme is light
  static bool isLightTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }
  
  /// Get the current theme's primary color
  static Color getPrimaryColor(BuildContext context) {
    return Theme.of(context).primaryColor;
  }
  
  /// Get the current theme's color scheme
  static ColorScheme getColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }
  
  /// Get the current theme's text theme
  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
} 