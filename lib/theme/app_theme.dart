import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: const Color.fromARGB(200, 127, 65, 192),
      scaffoldBackgroundColor: const Color.fromARGB(200, 203, 189, 247),
      cardColor: const Color.fromARGB(200, 203, 189, 247),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
        bodyMedium: TextStyle(color: Colors.white),
      ),
    );
  }
}
