import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  TextTheme get textTheme => Theme.of(this).textTheme;

  // Here Define Fonts Style Of APP
  TextStyle get textStyle => const TextStyle(
        fontSize: 20,
        fontFamily: 'Lexend',
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      );
}
