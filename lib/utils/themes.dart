import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme colorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.white,
    secondary: Colors.white,
    onSecondary: Colors.black,
    error: Colors.redAccent,
    onError: Colors.redAccent,
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  );

  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w900,
      fontSize: 32,
    ),
    displayMedium: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w900,
      fontSize: 24,
    ),
    displaySmall: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w900,
      fontSize: 20,
    ),
    headlineMedium: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w900,
      fontSize: 16,
    ),
    headlineSmall: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w900,
      fontSize: 14,
    ),
    titleLarge: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w900,
      fontSize: 12,
    ),
    bodyLarge: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    titleMedium: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    titleSmall: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w500,
      fontSize: 10,
    ),
    labelLarge: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w900,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w500,
      fontSize: 12,
    ),
    labelSmall: TextStyle(
      fontFamily: '',
      fontWeight: FontWeight.w500,
      fontSize: 10,
    ),
  );
}
