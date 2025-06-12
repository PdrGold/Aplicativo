import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.pinkAccent,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.lightBlueAccent,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.pinkAccent),
    bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
  ),
);
