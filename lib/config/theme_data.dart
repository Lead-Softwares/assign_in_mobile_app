import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const myPadding = 16.0;

ThemeData lightThemeData() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.dmSans(
        color: Colors.black87,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black87),
    ),
    textTheme: GoogleFonts.dmSansTextTheme().copyWith(
      titleLarge: GoogleFonts.dmSans(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: GoogleFonts.dmSans(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.dmSans(
        color: Colors.black87,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: GoogleFonts.dmSans(
        color: Colors.black87,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: GoogleFonts.dmSans(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: GoogleFonts.dmSans(
        color: Colors.grey,

        fontWeight: FontWeight.w500,
      ),
      labelMedium: GoogleFonts.dmSans(
        color: Colors.grey.shade700,

        fontWeight: FontWeight.w500,
      ),
      displaySmall: GoogleFonts.dmSans(
        color: Colors.black87,

        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.dmSans(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.dmSans(
        color: Colors.black87,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: GoogleFonts.dmSans(
        color: Colors.black87,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}
