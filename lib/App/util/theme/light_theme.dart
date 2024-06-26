import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  primaryColor: Colors.teal,
  secondaryHeaderColor: const Color(0xFF000743),
  disabledColor: const Color(0xFFA0A4A8),
  brightness: Brightness.light,
  hintColor: const Color(0xFF9F9F9F),
  cardColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.teal)),
  colorScheme:
      const ColorScheme.light(primary: Colors.teal, secondary: Colors.teal)
          .copyWith(
    error: const Color(0xFFE84D4F),
  ),
);
