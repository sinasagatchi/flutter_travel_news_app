import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static const Color navy = Color(0xFF14283F);
  static const Color white = Color(0xFFFFFFFF);
  static const Color teal = Color(0xFF27AFA3);
  static const Color secondaryGray = Color(0xFFA8B3BF);

  static const Color darkBackground = Color(0xFF101C2A);
  static const Color darkSurface = Color(0xFF1B2B3B);
  static const Color darkSecondaryText = Color(0xFFA8B7C5);

  static final ThemeData lightTheme = _createTheme(
    const ColorScheme(
      brightness: Brightness.light,
      primary: navy,
      onPrimary: white,
      secondary: teal,
      onSecondary: white,
      error: Color(0xFFB3261E),
      onError: white,
      surface: white,
      onSurface: navy,
      surfaceContainerHighest: white,
      onSurfaceVariant: secondaryGray,
      outline: secondaryGray,
    ),
  );

  static final ThemeData darkTheme = _createTheme(
    const ColorScheme(
      brightness: Brightness.dark,
      primary: teal,
      onPrimary: white,
      secondary: teal,
      onSecondary: white,
      error: Color(0xFFF2B8B5),
      onError: Color(0xFF601410),
      surface: darkSurface,
      onSurface: white,
      surfaceContainerHighest: Color(0xFF26384A),
      onSurfaceVariant: darkSecondaryText,
      outline: darkSecondaryText,
    ),
  );

  static ThemeData _createTheme(ColorScheme colorScheme) {
    final textTheme = GoogleFonts.poppinsTextTheme(
      ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ).textTheme,
    ).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      scaffoldBackgroundColor:
          colorScheme.brightness == Brightness.dark ? darkBackground : white,
      textTheme: textTheme,
      dividerColor: colorScheme.outline.withValues(alpha: 0.35),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        border: InputBorder.none,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.secondary,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        indicatorColor: colorScheme.secondary.withValues(alpha: 0.16),
        iconTheme: WidgetStatePropertyAll(
          IconThemeData(color: colorScheme.onSurfaceVariant),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surface,
        textStyle: textTheme.bodyMedium,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colorScheme.secondary,
      ),
    );
  }

  static TextStyle titleExtraLarge(BuildContext context) => GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );

  static TextStyle titleLarge(BuildContext context) => GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  static TextStyle titleMedium(BuildContext context) => GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle titleSmall(BuildContext context) => GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      );

  static TextStyle subtitleLarge(BuildContext context) => GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      );

  static TextStyle subtitleMedium(BuildContext context) => GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        fontSize: 12,
      );

  static TextStyle subtitleSmall(BuildContext context) => GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        fontSize: 11,
      );

  static TextStyle contentMedium(BuildContext context) => GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle titleFollowers(BuildContext context) => GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  static TextStyle subtitleFollowers(BuildContext context) =>
      GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  static TextStyle textButtonStyleSmall(BuildContext context) =>
      GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.secondary,
        fontSize: 12,
      );

  static TextStyle filledtButtonTextSmall(BuildContext context) =>
      GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 13,
      );

  static Color userBackground(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;

  static Color buttonBackground(BuildContext context) =>
      Theme.of(context).colorScheme.primary;

  static Color accentColor(BuildContext context) =>
      Theme.of(context).colorScheme.secondary;

  static Color cursorColor(BuildContext context) =>
      Theme.of(context).colorScheme.onSurfaceVariant;

  static Color scafoldBackgroundColor(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;
}
