import 'package:flutter/material.dart';

final myThemeLight = ThemeData.light().copyWith(
  primaryColor: const Color(0xff9e007e),
  // hintColor: Colors.blue[900],
  scaffoldBackgroundColor: const Color.fromARGB(255, 246, 235, 244),
  appBarTheme: const AppBarTheme(
    elevation: 10,
    color: Color(0xff9e007e),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 10,
    backgroundColor: Color(0xff9e007e),
  ),
);

final myThemeDark = ThemeData.dark().copyWith();
