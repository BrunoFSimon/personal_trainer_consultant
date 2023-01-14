import 'package:flutter/material.dart';

abstract class AppThemeData {
  static ThemeData get getThemeData {
    return ThemeData(
      primarySwatch: Colors.grey,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      ),
    );
  }
}
