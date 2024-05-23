import 'package:flutter/material.dart';

class AppTheme {
  late ColorScheme colorScheme;
  late PrimaryColors colors;

  late ThemeData themeData;

  AppTheme() {
    colorScheme = ColorSchemes.primaryColorScheme;
    colors = PrimaryColors();

    themeData = ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme, colors),
      scaffoldBackgroundColor: Colors.grey.shade100,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            visualDensity: const VisualDensity(
              vertical: -4,
              horizontal: -4,
            ),
            padding: EdgeInsets.zero,
            textStyle: const TextStyle(
                fontSize: 18,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                color: Colors.white)),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colors.blueGray400,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
        checkColor:
            MaterialStateColor.resolveWith((states) => colorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: Colors.grey, // Change the border color to grey
            width: 0.5,
          ),
        ),
      ),
    );
  }
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme, PrimaryColors colors) =>
      TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 18,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colors.blueGray400,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: colors.blueGray400,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          color: colors.blueGray900,
          fontSize: 28,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 12,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: colorScheme.onPrimary.withOpacity(1),
          fontSize: 10,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: colors.blueGray900,
          fontSize: 20,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: colors.blueGray900,
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: colors.blueGray900,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Colors.teal,

    // On colors(text colors)
    onPrimary: Color(0X26FFFFFF),
    secondary: Colors.white,
    secondaryContainer: Colors.grey,
    onPrimaryContainer: Color(0XFF27282E),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Black
  Color get black => Colors.black;

  // Blue
  Color get blue => Colors.blue.shade400;

  // BlueGray
  Color get blueGray400 => const Color(0XFF8C8F9D);
  Color get blueGray600 => const Color(0XFF505887);
  Color get blueGray900 => const Color(0XFF141E41);

  // Gray
  Color get gray400 => Colors.grey.shade400;

  // Green
  Color get green => Colors.green;

  // Indigo
  Color get indigo100 => const Color(0XFFC1C9E3);
  Color get indigo300 => const Color(0XFF6F82BF);
  Color get indigo50 => const Color(0XFFEAEDF6);
  Color get indigo500 => const Color(0XFF465EAC);

  // Pink
  Color get pink200 => Colors.pink.shade200;

  // Red
  Color get red700 => Colors.red.shade700;

  // Teal
  Color get teal50 => Colors.teal.shade50;
  Color get teal100 => Colors.teal.shade100;
  Color get teal400 => Colors.teal.shade400;
}

ThemeData get theme => AppTheme().themeData;
PrimaryColors get themeColors => PrimaryColors();
