import 'package:flutter/material.dart';
import 'package:timer_app/config/colors.dart';

ThemeData myTheme = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 60,
      color: timercolor,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 45,
      color: timercolor,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontSize: 30,
      color: timercolor,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
);
