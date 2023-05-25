import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeData theme;

  const ThemeState({required this.theme});

  @override
  List<Object> get props => [theme];
}

class DarkTheme extends ThemeState {
  DarkTheme()
      : super(
            theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
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
        ));
}

class LightTheme extends ThemeState {
  LightTheme()
      : super(
            theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
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
        ));
}
