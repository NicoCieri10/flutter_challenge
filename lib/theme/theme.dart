import 'package:flutter/material.dart';

final _defaultLigthTheme = ThemeData.light();

final myThemeLight = ThemeData.light().copyWith(
  primaryColor: const Color(0xff9e007e),
  // hintColor: Colors.blue[900],
  scaffoldBackgroundColor: Colors.white,
  cardColor: const Color.fromARGB(255, 246, 217, 241),
  appBarTheme: const AppBarTheme(
    elevation: 10,
    color: Color(0xff9e007e),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 10,
    backgroundColor: Color(0xff9e007e),
  ),
  textTheme: TextTheme(
    titleLarge: _defaultLigthTheme.textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w500,
    ),
    titleMedium: _defaultLigthTheme.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w500,
    ),
    titleSmall: _defaultLigthTheme.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: _defaultLigthTheme.textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: _defaultLigthTheme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w400,
    ),
    bodySmall: _defaultLigthTheme.textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: _defaultLigthTheme.textTheme.headlineLarge?.copyWith(
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: _defaultLigthTheme.textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: _defaultLigthTheme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
    ),
  ),
);

final myThemeDark = ThemeData.dark().copyWith();
