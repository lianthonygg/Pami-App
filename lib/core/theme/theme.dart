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
    alpha: 0.7,
  );
  static final Color lightFillTranslucent = Colors.white.withValues(alpha: 0.8);
  static final Color lightBorderTranslucent = Colors.white.withValues(
    alpha: 0.25,
  );

  static final Color darkSurfaceTranslucent = const Color(
    0xFF1E293B,
  ).withValues(alpha: 0.85);
  static final Color darkFillTranslucent = Colors.white.withValues(alpha: 0.08);
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
    fontFamily: GoogleFonts.poppins().fontFamily,
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
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF1F2937),
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1F2937),
      ),
      labelMedium: TextStyle(
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
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _brightBlue,
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _brightBlue.withValues(alpha: 0.5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightFillTranslucent,
      labelStyle: const TextStyle(color: Color(0xFF4B5563)),
      hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
      errorStyle: const TextStyle(color: Color(0xFFF87171), fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _vividPurple, width: 2),
      ),
      prefixIconColor: const Color(0xFF6B7280),
      suffixIconColor: const Color(0xFF6B7280),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(fontSize: 16, color: Color(0xFF1F2937)),
      inputDecorationTheme: const InputDecorationTheme(),
    ),
    cardTheme: CardThemeData(
      color: lightSurfaceTranslucent,
      elevation: 6,
      shadowColor: _brightBlue.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: lightBorderTranslucent),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: lightSurfaceTranslucent,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Color(0xFF1F2937),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(color: Color(0xFF1F2937)),
    ),
    useMaterial3: true,
  );

  // 🌙 Tema oscuro
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.poppins().fontFamily,
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
      headlineMedium: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      labelMedium: const TextStyle(
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
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _brightBlue,
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _brightBlue.withValues(alpha: 0.5)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkFillTranslucent,
      labelStyle: const TextStyle(color: Colors.white70),
      hintStyle: const TextStyle(color: Colors.white54),
      errorStyle: const TextStyle(color: Color(0xFFFCA5A5), fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _vividPurple, width: 2),
      ),
      prefixIconColor: Colors.white70,
      suffixIconColor: Colors.white70,
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(fontSize: 16, color: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(),
    ),
    cardTheme: CardThemeData(
      color: darkSurfaceTranslucent,
      elevation: 6,
      shadowColor: _brightBlue.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: darkBorderTranslucent),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkSurfaceTranslucent,
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    useMaterial3: true,
  );
}
