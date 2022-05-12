import 'package:flutter/material.dart';
import 'package:mds/common/assets/constants.dart';

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
        appBarTheme: AppBarTheme(
          backgroundColor: themeData.scaffoldBackgroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: AppColors.primaryColor,
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primaryColor,
        ),
        shadowColor: AppColors.greyColor,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: _inputBorder,
          border: _inputBorder,
          enabledBorder: _inputBorder,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: Constants.mediumPadding,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(AppColors.primaryColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: Constants.mediumPadding * 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                Constants.borderRadius * 1.5,
              ),
            ),
          ),
        ),
      );

  static final InputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      Constants.borderRadius * 2,
    ),
    borderSide: const BorderSide(
      color: AppColors.primaryColor,
    ),
  );
}

class AppColors {
  AppColors._();

  static const primaryColor = Color(0xFF446DE6);
  static const greyColor = Color(0xFFBDBDBD);
}
