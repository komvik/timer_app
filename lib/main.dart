import 'package:flutter/material.dart';
import 'package:timer_app/feature/screen/general_screen_timer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  final sTsTcL = " Programm Timer";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 223, 143),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 249, 223, 143),
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

String? timeFunction(int sTsTcL) {
  switch (sTsTcL) {
    case 0:
      return "Start";
    case 1:
      return "Stop";
    case 2:
      return "Clear";
  }
  return null;
}
