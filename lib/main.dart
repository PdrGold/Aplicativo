import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'theme.dart';

void main() {
  runApp(AmorApp());
}

class AmorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amor',  // Nome do app na barra do app e em multitarefa
      theme: appTheme,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

