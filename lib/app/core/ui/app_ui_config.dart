import 'package:flutter/material.dart';

class AppUiConfig {
  AppUiConfig._();

  static const MaterialColor _swatch = MaterialColor(0xFF0066B0, {
    050: Color(0xFF005c9e),
    100: Color(0xFF00528d),
    200: Color(0xFF00477b),
    300: Color(0xFF003d6a),
    400: Color(0xFF003358),
    500: Color(0xFF002946),
    600: Color(0xFF001f35),
    700: Color(0xFF001423),
    800: Color(0xFF000a12),
    900: Color(0xFF000000),
  });

  static String get title => 'Custo Industrial Prático';

  static var theme = ThemeData(
    fontFamily: 'Lexend',
    primarySwatch: _swatch,
    primaryColor: const Color(0xFF003358),
    primaryColorLight: const Color(0xFF0066B0),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 60),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    ),
  );
}
