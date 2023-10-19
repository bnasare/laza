import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  ThemeData themeData(BuildContext context) {
    return ThemeData(
      colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color.fromRGBO(151, 117, 250, 1),
          secondary: const Color.fromRGBO(29, 30, 32, 1),
          onSecondary: const Color.fromRGBO(52, 197, 89, 1),
          background: const Color.fromRGBO(245, 246, 250, 1),
          onTertiary: const Color.fromRGBO(255, 152, 31, 1),
          tertiary: const Color.fromRGBO(143, 149, 158, 1)),
      textTheme: GoogleFonts.interTextTheme(),
    );
  }
}
