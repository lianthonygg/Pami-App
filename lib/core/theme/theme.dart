import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Predefined translucent colors for light mode
  static final Color lightSurfaceTranslucent = Colors.white.withValues(
    alpha: 0.1 * 255,
  );
  static final Color lightFillTranslucent = const Color(
    0xFFDBEAFE,
  ).withValues(alpha: 0.2 * 255);
  static final Color lightBorderTranslucent = const Color(
    0xFFDBEAFE,
  ).withValues(alpha: 0.3 * 255);
  static final Color buttonShadowTranslucent = const Color(
    0xFF3B82F6,
  ).withValues(alpha: 0.5 * 255);

  // Predefined translucent colors for dark mode
  static final Color darkSurfaceTranslucent = const Color(
    0xFF374151,
  ).withValues(alpha: 0.9 * 255);
  static final Color darkFillTranslucent = const Color(
    0xFF6B7280,
  ).withValues(alpha: 0.2 * 255);
  static final Color darkBorderTranslucent = const Color(
    0xFF6B7280,
  ).withValues(alpha: 0.3 * 255);

  // Light mode theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF7C3AED), // Vivid Purple
    scaffoldBackgroundColor: const Color(0xFFF3E8FF), // Light Purple
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF7C3AED), // Vivid Purple
      secondary: const Color(0xFF3B82F6), // Bright Blue
      surface: const Color(0xFFFFFFFF), // White for cards
      onPrimary: const Color(0xFFF9FAFB), // Off-White for text on primary
      onSecondary: const Color(0xFFF9FAFB), // Off-White for text on secondary
      onSurface: const Color(0xFF1F2937), // Dark Gray for text on surfaces
      error: const Color(0xFFFCA5A5), // Soft Red
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F2937), // Dark Gray
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1F2937), // Dark Gray
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF6B7280), // Medium Gray
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3B82F6), // Bright Blue
        foregroundColor: const Color(0xFFF9FAFB), // Off-White
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        shadowColor: buttonShadowTranslucent, // Predefined translucent color
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightFillTranslucent, // Predefined translucent color
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFF7C3AED),
          width: 2,
        ), // Vivid Purple
      ),
      labelStyle: GoogleFonts.poppins(
        color: const Color(0xFF6B7280),
      ), // Medium Gray
      prefixIconColor: const Color(0xFF6B7280), // Medium Gray
      suffixIconColor: const Color(
        0xFF6B7280,
      ), // Medium Gray for password toggle
    ),
    cardTheme: CardTheme(
      color: lightSurfaceTranslucent, // Predefined translucent color
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: lightBorderTranslucent,
        ), // Predefined translucent color
      ),
    ),
  );

  // Dark mode theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF7C3AED), // Vivid Purple
    scaffoldBackgroundColor: const Color(0xFF1F2937), // Dark Gray
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF7C3AED), // Vivid Purple
      secondary: const Color(0xFF3B82F6), // Bright Blue
      surface: const Color(0xFF374151), // Darker Gray for cards
      onPrimary: const Color(0xFFF9FAFB), // Off-White for text on primary
      onSecondary: const Color(0xFFF9FAFB), // Off-White for text on secondary
      onSurface: const Color(0xFFF9FAFB), // Off-White for text on surfaces
      error: const Color(0xFFFCA5A5), // Soft Red
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: const Color(0xFFD1D5DB), // Off-White
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFFF9FAFB), // Off-White
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFD1D5DB), // Light Gray
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF3B82F6), // Bright Blue
        foregroundColor: const Color(0xFFF9FAFB), // Off-White
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        shadowColor: buttonShadowTranslucent, // Predefined translucent color
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkFillTranslucent, // Predefined translucent color
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFF7C3AED),
          width: 2,
        ), // Vivid Purple
      ),
      labelStyle: GoogleFonts.poppins(
        color: const Color(0xFFD1D5DB),
      ), // Light Gray
      prefixIconColor: const Color(0xFFD1D5DB), // Light Gray
      suffixIconColor: const Color(
        0xFFD1D5DB,
      ), // Light Gray for password toggle
    ),
    cardTheme: CardTheme(
      color: darkSurfaceTranslucent, // Predefined translucent color
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: darkBorderTranslucent,
        ), // Predefined translucent color
      ),
    ),
  );
}
