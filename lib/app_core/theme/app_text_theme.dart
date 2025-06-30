import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/screen_utils.dart';

/// App text theme configuration
class AppTextTheme {
  /// Creates the app's text theme using Google Fonts with responsive sizing
  static TextTheme get textTheme {
    return GoogleFonts.robotoTextTheme().copyWith(
      // Headlines
      displayLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(32),
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(28),
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      displaySmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(24),
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      
      // Titles
      headlineLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(22),
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(20),
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(18),
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      
      // Body text
      titleLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(20),
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(16),
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(14),
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      
      bodyLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(16),
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(15),
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(14),
        fontWeight: FontWeight.normal,
        color: Colors.black87,
      ),
      
      // Labels
      labelLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(14),
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(12),
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(10),
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }

  /// Creates the dark text theme with responsive sizing
  static TextTheme get darkTextTheme {
    return GoogleFonts.robotoTextTheme().copyWith(
      // Headlines
      displayLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(32),
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(28),
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(24),
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      
      // Titles
      headlineLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(22),
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(20),
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(18),
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      
      // Body text
      titleLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(20),
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(16),
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(14),
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      
      bodyLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(16),
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(15),
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(14),
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
      
      // Labels
      labelLarge: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(14),
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelMedium: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(12),
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: ScreenUtils.getFontSize(10),
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
} 