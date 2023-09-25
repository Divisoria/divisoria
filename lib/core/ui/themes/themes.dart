import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme kLightScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF714B67),
  secondary: const Color(0xff017e84),
  secondaryContainer: const Color(0xff00a09d),
);
ColorScheme kTextScheme = ColorScheme.fromSeed(
  seedColor: Colors.black,
  primary: Colors.black,
  secondary: const Color.fromRGBO(0, 126, 132, 1.0),
  tertiary: const Color(0xff8f8f8f),
);

ColorScheme kDarkScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(113, 75, 103, 1.0),
);

class AppTheme {
  static ThemeData light = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: kLightScheme,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 1,
        backgroundColor: kLightScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    ),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      //Texts Bold
      displayLarge: GoogleFonts.interTextTheme().displayLarge?.copyWith(
          fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
      //Largetexts
      bodyLarge: GoogleFonts.interTextTheme().bodyLarge?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 24,
          ),
      // Medium Texts
      bodyMedium: GoogleFonts.interTextTheme().bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            // Highlight Text
          ),
      displayMedium: GoogleFonts.interTextTheme().displayMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: kTextScheme.primary,
          ),

      // Medium Button Text
      labelLarge: GoogleFonts.interTextTheme().labelLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: const Color(0xFFFFFFFF),
          ),

      titleLarge: GoogleFonts.interTextTheme().titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 28,
            color: const Color(0xFFFFFFFF),
          ),

      bodySmall: GoogleFonts.interTextTheme().bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: const Color(0xFFFFFFFF),
          ),

      titleSmall: GoogleFonts.interTextTheme().titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kLightScheme.primary,
          ),

      labelSmall: GoogleFonts.interTextTheme().labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: kTextScheme.tertiary,
          ),

      displaySmall: GoogleFonts.interTextTheme().displaySmall?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: Colors.white,
          ),
    ),
    iconTheme: IconThemeData(
      color: kLightScheme.secondary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: kLightScheme.secondary,
      suffixIconColor: kLightScheme.secondary,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
    ),
  );

  static ThemeData dark = ThemeData().copyWith(
    useMaterial3: true,
    colorScheme: kDarkScheme,
  );
}
