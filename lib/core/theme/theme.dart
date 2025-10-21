import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 🎨 Colores base
  static const _vividPurple = Color(0xFF7C3AED);
  static const _brightBlue = Color(0xFF3B82F6);
  static const _darkBgTop = Color(0xFF0F172A);
  static const _darkBgBottom = Color(0xFF1E293B);
  static const _lightBgTop = Color(0xFFF3E8FF);
  static const _lightBgBottom = Color(0xFFE0EAFF);

  // 🌈 Gradientes de fondo
  static LinearGradient lightBackgroundGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [_lightBgTop, _lightBgBottom],
  );

  static LinearGradient darkBackgroundGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [_darkBgTop, _darkBgBottom],
  );

  // 🪟 Colores translúcidos (efecto vidrio)
  static final Color lightSurfaceTranslucent = Colors.white.withValues(
    alpha: 0.6,
  );
  static final Color lightFillTranslucent = Colors.white.withValues(alpha: 0.5);
  static final Color lightBorderTranslucent = Colors.white.withValues(
    alpha: 0.3,
  );

  static final Color darkSurfaceTranslucent = const Color(
    0xFF1E293B,
  ).withValues(alpha: 0.8);
  static final Color darkFillTranslucent = Colors.white.withValues(alpha: 0.05);
  static final Color darkBorderTranslucent = Colors.white.withValues(
    alpha: 0.08,
  );

  static final Color buttonShadowTranslucent = _brightBlue.withValues(
    alpha: 0.4,
  );

  // ☀️ Tema claro
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme.light(
      primary: _vividPurple,
      secondary: _brightBlue,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFF1F2937),
      error: Color(0xFFF87171),
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F2937),
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1F2937),
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF6B7280),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _brightBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        shadowColor: buttonShadowTranslucent,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightFillTranslucent,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _vividPurple, width: 2),
      ),
      labelStyle: GoogleFonts.poppins(color: const Color(0xFF4B5563)),
      prefixIconColor: const Color(0xFF6B7280),
      suffixIconColor: const Color(0xFF6B7280),
    ),
    cardTheme: CardTheme(
      color: lightSurfaceTranslucent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: lightBorderTranslucent),
      ),
    ),
  );

  // 🌙 Tema oscuro
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: const ColorScheme.dark(
      primary: _vividPurple,
      secondary: _brightBlue,
      surface: Color(0xFF1E293B),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      error: Color(0xFFFCA5A5),
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _brightBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        shadowColor: buttonShadowTranslucent,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkFillTranslucent,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _vividPurple, width: 2),
      ),
      labelStyle: GoogleFonts.poppins(color: Colors.white70),
      prefixIconColor: Colors.white70,
      suffixIconColor: Colors.white70,
    ),
    cardTheme: CardTheme(
      color: darkSurfaceTranslucent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: darkBorderTranslucent),
      ),
    ),
  );
}
