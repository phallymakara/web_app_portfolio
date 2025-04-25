import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF561895);

  static const gray = {100: Color(0xFFF5F5F5), 800: Color(0xFF424242)};
}

// const String fontFamily = 'YourFontFamily'; // Replace with your font family

class AppTheme {
  final String fontFamily;

  const AppTheme({required this.fontFamily});

  ThemeData get dark => getDarkTheme();
  ThemeData get light => getLightTheme();

  ThemeData getLightTheme() => _getThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      background: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      outline: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white.withOpacity(0.8),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    elevatedButtonTextStyle: _getLightElevatedButtonTextStyle(),
    outlinedButtonTextStyle: _getLightOutlinedButtonTextStyle(),
  );

  ThemeData getDarkTheme() => _getThemeData(
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      background: Colors.black,
      surface: Colors.black,
      onSurface: Colors.white,
      outline: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black.withOpacity(0.8),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    elevatedButtonTextStyle: _getDarkElevatedButtonTextStyle(),
    outlinedButtonTextStyle: _getDarkOutlinedButtonTextStyle(),
  );

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
    required WidgetStateProperty<TextStyle> outlinedButtonTextStyle,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: appBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStatePropertyAll(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          ),
          textStyle: elevatedButtonTextStyle,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
          side: _outlineButtonStates,
          padding: WidgetStatePropertyAll(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          ),
          textStyle: outlinedButtonTextStyle,
        ),
      ),
    );
  }

  WidgetStateProperty<Color> get _primaryButtonStates =>
      WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return AppColors.primaryColor.withOpacity(0.7);
        }
        return AppColors.primaryColor;
      });

  WidgetStateProperty<BorderSide> get _outlineButtonStates =>
      WidgetStateProperty.resolveWith<BorderSide>((states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return BorderSide(color: AppColors.primaryColor.withOpacity(0.7));
        }
        return const BorderSide(color: AppColors.primaryColor);
      });

  WidgetStatePropertyAll<TextStyle> _getDarkElevatedButtonTextStyle() =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  WidgetStatePropertyAll<TextStyle> _getLightElevatedButtonTextStyle() =>
      WidgetStatePropertyAll(
        TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  WidgetStatePropertyAll<TextStyle> _getDarkOutlinedButtonTextStyle() =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  WidgetStatePropertyAll<TextStyle> _getLightOutlinedButtonTextStyle() =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[800],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );
}
