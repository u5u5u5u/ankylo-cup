import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: const Color.fromARGB(200, 127, 65, 192),
      scaffoldBackgroundColor: const Color.fromARGB(200, 203, 189, 247),
      cardColor: const Color.fromARGB(200, 203, 189, 247),
      textTheme: GoogleFonts.pressStart2pTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
    );
  }
}
