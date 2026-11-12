import 'package:contacts/core/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.primary,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
      labelSmall:TextStyle(
        color: AppColors.surface,
        fontWeight: FontWeight.w500,
        fontSize: 10,
        letterSpacing: 0
      ),
      labelLarge:TextStyle(
        color: AppColors.surface,
        fontWeight: FontWeight.w500,
        letterSpacing: 0
      ),
      
    ),
  );
}
