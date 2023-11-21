import 'package:flutter/material.dart';

final ThemeData defaultTheme = _defaultTheme();

ThemeData _defaultTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: Color.fromARGB(255, 51, 197, 255),
      onPrimary: Colors.white,
      secondary: const Color.fromARGB(255, 223, 27, 12),
      onSecondary: Colors.white,
      background: const Color.fromARGB(255, 228, 243, 228),
      onBackground: Colors.black,
    ),

    elevatedButtonTheme: _elevatedButtonTheme(base.elevatedButtonTheme),
    inputDecorationTheme: _inputDecorationTheme(base.inputDecorationTheme),
  );
}

InputDecorationTheme _inputDecorationTheme(InputDecorationTheme base) =>
    const InputDecorationTheme(
// Label color for the input widget
      labelStyle: TextStyle(color: Colors.black),
// Define border of input form while focused on
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.black,
          style: BorderStyle.solid,
        ),
      ),
    );

ElevatedButtonThemeData _elevatedButtonTheme(ElevatedButtonThemeData base) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 223, 27, 12),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
    );