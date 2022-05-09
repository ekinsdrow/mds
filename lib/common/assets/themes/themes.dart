import 'package:flutter/material.dart';

abstract class Themes {
  static get darkTheme => _getTheme(
        ThemeData.dark(),
      );
  static get lightTheme => _getTheme(
        ThemeData.light(),
      );

  static ThemeData _getTheme(ThemeData themeData) => themeData.copyWith(
        primaryColor: Colors.primaryColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.primaryColor,
        ),
      );
}

class Colors {
  Colors._();

  static const primaryColor = Color(0xFF446DE6);
}
