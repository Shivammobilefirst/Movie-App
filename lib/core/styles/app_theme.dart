import 'package:flutter/material.dart';
import 'package:movie_app/core/styles/app_colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: const ColorScheme.light(
        primary: AppColors.orange,
        secondary: AppColors.orange,
        onSecondary: Colors.white,
        onBackground: AppColors.grey,
        onSurface: AppColors.grey,
        outline: AppColors.grey,
      ),
    );
  }
}