import 'package:flutter/material.dart';

final defaultTheme = ThemeData.dark().copyWith(
  primaryColor: const Color(0xffff4a01),
  // TODO(shotaro): backgroundColor needs to be eliminated.
  // ignore_for_file: deprecated_member_use
  backgroundColor: const Color(0xff0a0a0a),
  scaffoldBackgroundColor: const Color(0xff0a0a0a),
  cardColor: const Color(0xff1e1d1d),
  disabledColor: const Color(0xff848484),
  unselectedWidgetColor: Colors.white,
  indicatorColor: Colors.deepOrangeAccent,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      side: const BorderSide(
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xffff4a01),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
  ),
  textTheme: ThemeData.dark().textTheme.copyWith(
        headlineSmall: const TextStyle(
          fontFamily: 'Archivo',
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: const TextStyle(
          fontFamily: 'MangoGrotesque',
          fontSize: 42,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1,
        ),
        // used by TextField
        titleMedium: const TextStyle(
          fontFamily: 'Archivo',
          fontSize: 22,
          color: Colors.white,
        ),
        titleSmall: const TextStyle(
          fontFamily: 'Archivo',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 1,
        ),
        bodyMedium: const TextStyle(
          fontFamily: 'Archivo',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xffbababa),
          height: 1,
        ),
        bodySmall: const TextStyle(
          fontFamily: 'Archivo',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xffd5d5d5),
          height: 1,
        ),
        labelLarge: const TextStyle(
          fontFamily: 'Archivo',
          fontSize: 15,
          color: Color(0xff202124),
          fontWeight: FontWeight.w600,
        ),
      ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      textStyle: const TextStyle(
        fontFamily: 'Archivo',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
      ),
    ),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0xFFFFBD00),
    labelStyle: TextStyle(
      fontFamily: 'Archivo',
      fontSize: 12,
      color: Color(0xFF1E1D1D),
      fontWeight: FontWeight.w500,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: const Color(0xffff4a01),
    secondary: Colors.orangeAccent,
    outline: const Color(0xff3e3e3e),
    background: const Color(0xff0a0a0a),
  ),
);

final japanTheme = defaultTheme.copyWith(
  textTheme: defaultTheme.textTheme.copyWith(
    titleLarge: const TextStyle(
      fontSize: 21,
      color: Colors.white,
      height: 1,
    ),
  ),
);
