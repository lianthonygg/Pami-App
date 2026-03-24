import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // 🎨 Colores base
  static const _emerald = Color(0xFF10B981);
  static const _emeraldDark = Color(0xFF059669);
  static const _emeraldDeep = Color(0xFF047857);
  static const _emeraldLight = Color(0xFF34D399);
  static const _minsapRed = Color(0xFFB71C1C);
  static const _minsapGold = Color(0xFFC9A84C);

  static const _darkBgTop = Color(0xFF0A1A14);
  static const _darkBgBottom = Color(0xFF111F18);
  static const _lightBgTop = Color(0xFFECFDF5);
  static const _lightBgBottom = Color(0xFFD1FAE5);

  // 🌈 Gradientes de fondo
  static const LinearGradient lightBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [_lightBgTop, _lightBgBottom],
  );

  static const LinearGradient darkBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [_darkBgTop, _darkBgBottom],
  );

  // 🪟 Superficies translúcidas
  static final Color lightSurfaceTranslucent = Colors.white.withValues(
    alpha: 0.75,
  );
  static final Color lightFillTranslucent = Colors.white.withValues(
    alpha: 0.85,
  );
  static final Color lightBorderTranslucent = _emerald.withValues(alpha: 0.15);

  static final Color darkSurfaceTranslucent = const Color(
    0xFF111F18,
  ).withValues(alpha: 0.85);
  static final Color darkFillTranslucent = Colors.white.withValues(alpha: 0.07);
  static final Color darkBorderTranslucent = _emeraldLight.withValues(
    alpha: 0.12,
  );

  static final Color buttonShadowTranslucent = _emerald.withValues(alpha: 0.4);

  // ☀️ Tema claro
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: ColorScheme.light(
      primary: _emeraldDark,
      secondary: _emerald,
      tertiary: _minsapGold,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: const Color(0xFF064E3B),
      error: _minsapRed,
      onError: Colors.white,
      outline: _emerald.withValues(alpha: 0.3),
      surfaceContainerHighest: const Color(0xFFECFDF5),
    ),
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF064E3B),
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF065F46),
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF059669),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _emeraldDark,
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.white,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _emeraldDark,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        shadowColor: buttonShadowTranslucent,
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _emeraldDark,
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _emeraldDark,
        side: BorderSide(color: _emeraldDark.withValues(alpha: 0.6)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightFillTranslucent,
      labelStyle: const TextStyle(color: Color(0xFF059669)),
      hintStyle: const TextStyle(color: Color(0xFF6EE7B7)),
      errorStyle: TextStyle(color: _minsapRed, fontSize: 13),
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
        borderSide: const BorderSide(color: _emeraldDark, width: 2),
      ),
      prefixIconColor: const Color(0xFF059669),
      suffixIconColor: const Color(0xFF059669),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(fontSize: 16, color: Color(0xFF064E3B)),
      inputDecorationTheme: InputDecorationTheme(),
    ),
    cardTheme: CardThemeData(
      color: lightSurfaceTranslucent,
      elevation: 6,
      shadowColor: _emerald.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: lightBorderTranslucent),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _emeraldDark,
      foregroundColor: Colors.white,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: _emerald.withValues(alpha: 0.1),
      labelStyle: const TextStyle(color: _emeraldDark),
      side: BorderSide(color: _emerald.withValues(alpha: 0.3)),
    ),
    dividerTheme: DividerThemeData(color: _emerald.withValues(alpha: 0.15)),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) =>
            states.contains(WidgetState.selected) ? _emeraldDark : Colors.grey,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) =>
            states.contains(WidgetState.selected)
                ? _emerald.withValues(alpha: 0.5)
                : Colors.grey.withValues(alpha: 0.3),
      ),
    ),
  );

  // 🌙 Tema oscuro
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: ColorScheme.dark(
      primary: _emerald,
      secondary: _emeraldLight,
      tertiary: _minsapGold,
      surface: const Color(0xFF111F18),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      error: const Color(0xFFEF9A9A),
      onError: Colors.black,
      outline: _emerald.withValues(alpha: 0.3),
      surfaceContainerHighest: const Color(0xFF0A1A14),
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
        color: _emeraldLight,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF0A1A14),
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.white,
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _emeraldDeep,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        shadowColor: buttonShadowTranslucent,
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _emeraldLight,
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _emeraldLight,
        side: BorderSide(color: _emeraldLight.withValues(alpha: 0.6)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkFillTranslucent,
      labelStyle: TextStyle(color: _emeraldLight),
      hintStyle: const TextStyle(color: Colors.white38),
      errorStyle: const TextStyle(color: Color(0xFFEF9A9A), fontSize: 13),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _emeraldLight, width: 2),
      ),
      prefixIconColor: _emeraldLight,
      suffixIconColor: _emeraldLight,
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(fontSize: 16, color: Colors.white),
      inputDecorationTheme: InputDecorationTheme(),
    ),
    cardTheme: CardThemeData(
      color: darkSurfaceTranslucent,
      elevation: 6,
      shadowColor: _emerald.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: darkBorderTranslucent),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _emeraldDeep,
      foregroundColor: Colors.white,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: _emeraldLight.withValues(alpha: 0.15),
      labelStyle: TextStyle(color: _emeraldLight),
      side: BorderSide(color: _emeraldLight.withValues(alpha: 0.3)),
    ),
    dividerTheme: DividerThemeData(
      color: _emeraldLight.withValues(alpha: 0.15),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) =>
            states.contains(WidgetState.selected) ? _emeraldLight : Colors.grey,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) =>
            states.contains(WidgetState.selected)
                ? _emeraldLight.withValues(alpha: 0.4)
                : Colors.grey.withValues(alpha: 0.2),
      ),
    ),
  );
}
