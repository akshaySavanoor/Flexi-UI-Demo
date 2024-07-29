import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData buildTheme() {
  return ThemeData(
    primaryColor: AppColors.deepGreen,
    hintColor: AppColors.lightSteelBlue,
    scaffoldBackgroundColor: AppColors.darkSlateBlue,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.deepGreen,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.lightSteelBlue, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: AppColors.slateBlue),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.lightSteelBlue,
      textTheme: ButtonTextTheme.primary,
    ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(surface: AppColors.darkSlateBlue),
  );
}
