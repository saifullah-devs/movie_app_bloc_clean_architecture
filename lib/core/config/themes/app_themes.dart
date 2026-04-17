import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_bloc/core/config/color/colors.dart';

class AppTheme {
  AppTheme._();

  // --- LIGHT THEME ---
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.primaryColor,
      appBarTheme: _headTheme,
      textTheme: _buildTextTheme(
        Colors.black87,
        Colors.black54,
      ), // Dark text for light bg
      inputDecorationTheme: _inputTheme,
      elevatedButtonTheme: _buttonTheme,
    );
  }

  // --- DARK THEME ---
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColor,
        secondary: AppColors.secondaryColor,
        surface: Color(0xFF121212),
      ),
      appBarTheme: _headTheme.copyWith(backgroundColor: Colors.black),
      textTheme: _buildTextTheme(
        Colors.white,
        Colors.white70,
      ), // Light text for dark bg
      inputDecorationTheme: _inputTheme,
      elevatedButtonTheme: _buttonTheme,
    );
  }

  // --- THE 15 TEXT TYPES DEFINITION ---
  static TextTheme _buildTextTheme(Color primaryColor, Color secondaryColor) {
    return TextTheme(
      // DISPLAY: Large, short, important text (e.g., Movie Titles in Headers)
      displayLarge: GoogleFonts.poppins(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),

      // HEADLINE: High-emphasis text (e.g., "Popular TV Shows" section titles)
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),

      // TITLE: Medium-emphasis text (e.g., Movie Names in Cards)
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primaryColor,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryColor,
        letterSpacing: 0.1,
      ),

      // BODY: Longer passages of text (e.g., Movie Synopsis/About)
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: primaryColor,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: secondaryColor,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: secondaryColor,
        letterSpacing: 0.4,
      ),

      // LABEL: Smallest text (e.g., "Running" badges, Pagination numbers, Button labels)
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryColor,
        letterSpacing: 0.1,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
        letterSpacing: 0.5,
      ),
      labelSmall: GoogleFonts.poppins(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: secondaryColor,
        letterSpacing: 0.5,
      ),
    );
  }

  // --- SUB-THEMES ---

  static final AppBarTheme _headTheme = AppBarTheme(
    backgroundColor: AppColors.primaryColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white, size: 24),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static final InputDecorationTheme _inputTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white.withValues(alpha: 0.05), // Modern glass effect
    contentPadding: const EdgeInsets.all(16),
    hintStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
    ),
  );

  static final ElevatedButtonThemeData _buttonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}
