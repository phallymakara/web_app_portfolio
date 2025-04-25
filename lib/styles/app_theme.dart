import 'package:flutter/material.dart';
import 'package:portfolio/styles/app_colors.dart';

class AppTheme {
  static ThemeData get dark => ThemeData(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      surface: AppColors.darkBackgroundColor,
      onSurface: AppColors.gray[100]!,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    appBarTheme: AppBarTheme(color: AppColors.gray[900]),
  );
}
