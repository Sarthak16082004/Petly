import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Legacy color constants used by other screens
  static const Color growthColor = Color(0xFF16a34a);
  static const Color medicalColor = Color(0xFF0d9488);
  static const Color appointmentColor = Color(0xFF8b5cf6);
  static const Color vaccinationColor = Color(0xFF2563eb);
  static const Color documentColor = Color(0xFFf59e0b);
  static const Color expenseColor = Color(0xFFf97316);
  static const Color medicineColor = Color(0xFF10b981);
  static const Color reminderColor = Color(0xFFfacc15);
  static const Gradient brandGradient = LinearGradient(
    colors: [Color(0xFF2563eb), Color(0xFF004ac6)],
  );

  static ThemeData get lightTheme {
    return _buildTheme(Brightness.light, _lightColorScheme);
  }

  static ThemeData get darkTheme {
    return _buildTheme(Brightness.dark, _darkColorScheme);
  }

  static ThemeData _buildTheme(Brightness brightness, ColorScheme colorScheme) {
    // Determine the base text theme from Google Fonts based on brightness
    final baseTextTheme = brightness == Brightness.light
        ? ThemeData.light().textTheme
        : ThemeData.dark().textTheme;

    // Use Inter for body and label, and also for headlines to avoid missing font issues
    final interTextTheme = GoogleFonts.interTextTheme(baseTextTheme);
    final geistTextTheme = GoogleFonts.interTextTheme(baseTextTheme);

    final textTheme = baseTextTheme.copyWith(
      displayLarge: geistTextTheme.displayLarge,
      displayMedium: geistTextTheme.displayMedium,
      displaySmall: geistTextTheme.displaySmall,
      headlineLarge: geistTextTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
      headlineMedium: geistTextTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
      headlineSmall: geistTextTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
      titleLarge: geistTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      titleMedium: geistTextTheme.titleMedium,
      titleSmall: geistTextTheme.titleSmall,
      bodyLarge: interTextTheme.bodyLarge,
      bodyMedium: interTextTheme.bodyMedium,
      bodySmall: interTextTheme.bodySmall,
      labelLarge: interTextTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      labelMedium: interTextTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
      labelSmall: interTextTheme.labelSmall,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: textTheme.headlineSmall?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: colorScheme.outlineVariant.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: brightness == Brightness.light ? const Color(0xFFffffff) : const Color(0xFF060d17),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent, 
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF004ac6),
    onPrimary: Color(0xFFffffff),
    primaryContainer: Color(0xFF2563eb),
    onPrimaryContainer: Color(0xFFffffff),
    secondary: Color(0xFF006c49),
    onSecondary: Color(0xFFffffff),
    secondaryContainer: Color(0xFF6cf8bb),
    onSecondaryContainer: Color(0xFF002113),
    tertiary: Color(0xFF525657),
    onTertiary: Color(0xFFffffff),
    tertiaryContainer: Color(0xFFc4c7c9),
    onTertiaryContainer: Color(0xFF000000),
    error: Color(0xFFba1a1a),
    onError: Color(0xFFffffff),
    errorContainer: Color(0xFFffdad6),
    onErrorContainer: Color(0xFF93000a),
    background: Color(0xFFf8f9ff),
    onBackground: Color(0xFF0b1c30),
    surface: Color(0xFFf8f9ff),
    onSurface: Color(0xFF0b1c30),
    surfaceVariant: Color(0xFFd3e4fe),
    onSurfaceVariant: Color(0xFF434655),
    outline: Color(0xFF737686),
    outlineVariant: Color(0xFFc3c6d7),
    inverseSurface: Color(0xFF213145),
    onInverseSurface: Color(0xFFeaf1ff),
    inversePrimary: Color(0xFFb4c5ff),
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFb4c5ff),
    onPrimary: Color(0xFF00174b),
    primaryContainer: Color(0xFF2563eb),
    onPrimaryContainer: Color(0xFFffffff),
    secondary: Color(0xFF4edea3),
    onSecondary: Color(0xFF003926),
    secondaryContainer: Color(0xFF005236),
    onSecondaryContainer: Color(0xFF6ffbbe),
    tertiary: Color(0xFFc4c7c9),
    onTertiary: Color(0xFF191c1e),
    tertiaryContainer: Color(0xFF444749),
    onTertiaryContainer: Color(0xFFe0e3e5),
    error: Color(0xFFffb4ab),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000a),
    onErrorContainer: Color(0xFFffdad6),
    background: Color(0xFF0b1c30),
    onBackground: Color(0xFFeaf1ff),
    surface: Color(0xFF0b1c30),
    onSurface: Color(0xFFeaf1ff),
    surfaceVariant: Color(0xFF434655),
    onSurfaceVariant: Color(0xFFc3c6d7),
    outline: Color(0xFF8e919f),
    outlineVariant: Color(0xFF434655),
    inverseSurface: Color(0xFFf8f9ff),
    onInverseSurface: Color(0xFF0b1c30),
    inversePrimary: Color(0xFF004ac6),
  );
}

// Extension to map Material 3 surface containers which are not in ColorScheme yet
extension ColorSchemeSurfaceContainers on ColorScheme {
  Color get surfaceContainerLowest => brightness == Brightness.light ? const Color(0xFFffffff) : const Color(0xFF060d17);
  Color get surfaceContainerLow => brightness == Brightness.light ? const Color(0xFFeff4ff) : const Color(0xFF15253a);
  Color get surfaceContainer => brightness == Brightness.light ? const Color(0xFFe5eeff) : const Color(0xFF1d2e46);
  Color get surfaceContainerHigh => brightness == Brightness.light ? const Color(0xFFdce9ff) : const Color(0xFF263852);
  Color get surfaceContainerHighest => brightness == Brightness.light ? const Color(0xFFd3e4fe) : const Color(0xFF32435b);
}
