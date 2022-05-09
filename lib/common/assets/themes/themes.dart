import 'package:flutter/material.dart';

abstract class Themes {
  static get darkTheme => _getTheme(
        ThemeData.dark(),
      );
  static get lightTheme => _getTheme(
        ThemeData.light(),
      );

  static ThemeData _getTheme(ThemeData themeData) => themeData.copyWith(
        primaryColor: AppColors.primaryColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor,
        ),
        shadowColor: Colors.grey.withOpacity(.3),
      );
}

class AppColors {
  AppColors._();

  static const primaryColor = Color(0xFF446DE6);
}
