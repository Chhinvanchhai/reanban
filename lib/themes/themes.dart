import 'package:flutter/material.dart';
import 'package:reanban/constants.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: secondaryColor),
          bodyMedium: TextStyle(color: secondaryColor),
          bodySmall: TextStyle(color: secondaryColor),
          displaySmall: TextStyle(color: secondaryColor),
          displayMedium: TextStyle(color: secondaryColor),
          displayLarge: TextStyle(color: secondaryColor)),
      colorScheme: const ColorScheme.light().copyWith(
          primary: const Color.fromARGB(255, 47, 74, 109),
          secondary: const Color.fromARGB(255, 225, 225, 226),
          background: bgLight,
          onBackground: Colors.white),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      colorScheme: const ColorScheme.dark().copyWith(
          secondary: const Color(0xFF101427),
          primary: const Color.fromARGB(255, 168, 167, 167),
          onBackground: bgDark),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displayLarge: TextStyle(color: Colors.white)),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ));
}
