import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '15',
                    style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 3, 31, 72),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    's',
                    style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 3, 31, 72),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Start"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Stop"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Clear"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
