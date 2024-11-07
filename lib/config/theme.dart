import 'package:flutter/material.dart';
import 'package:timer_app/config/colors.dart';

ThemeData myTheme = ThemeData(
  useMaterial3: true,
  textTheme: const TextTheme(
    //_______________________________DISPLAY
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
      fontSize: 26,
      color: timercolor,
    ),
    //_______________________________TITLE
    titleLarge: TextStyle(
      fontSize: 22,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    //_______________________________BODY
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Color.fromARGB(255, 7, 65, 165),
      fontWeight: FontWeight.bold,
    ),
  ),
);
