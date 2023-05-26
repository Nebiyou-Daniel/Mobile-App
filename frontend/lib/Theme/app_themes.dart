import 'package:flutter/material.dart';

enum AppTheme {
  // ignore: constant_identifier_names
  DarkTheme,
  // ignore: constant_identifier_names
  LightTheme,
}

// app theme data

final appThemeData = {
  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  ),
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    fontFamily: 'Montserrat',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Colors.black)
        .copyWith(secondary: Colors.black),
  ),
};
