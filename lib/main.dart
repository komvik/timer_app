import 'package:flutter/material.dart';
import 'package:timer_app/config/colors.dart';
import 'package:timer_app/config/theme.dart';
import 'package:timer_app/feature/screen/general_screen_timer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  final String sTsTcL = " Programm Timer";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: bgcolor,
          title: Text(
            sTsTcL,
            style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 3, 31, 72),
                fontWeight: FontWeight.bold),
          ),
        ),
        body: const GeneralScreenTimer(),
      ),
    );
  }
}
