import 'package:flutter/material.dart';

abstract class Themes {
  static get darkTheme => _getTheme(
        ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Montserrat',
        ),
      );
  static get lightTheme => _getTheme(
        ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Montserrat',
        ),
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
