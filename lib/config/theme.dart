import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData() {
  return ThemeData(
    primaryColor: const Color(0xFFFFE1A8),
    primaryColorDark: const Color(0xFFAB8338),
    primaryColorLight: const Color(0xFFAB8338),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xFFF5F5F5),
    fontFamily: 'Plus Jakarta Sans',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFE1A8),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.nunito(
        color: const Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 38,
      ),
      headline2: GoogleFonts.nunito(
        color: const Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      headline3: GoogleFonts.nunito(
        color: const Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headline4: GoogleFonts.nunito(
        color: const Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: GoogleFonts.nunito(
        color: const Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      headline6: GoogleFonts.nunito(
        color: const Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText1: GoogleFonts.nunito(
        color: const Color(0xFF1B070B),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      bodyText2: GoogleFonts.nunito(
        color: const Color(0xFF1B070B),
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
