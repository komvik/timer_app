import 'package:flutter/material.dart';

class GeneralScreenTimer extends StatefulWidget {
  const GeneralScreenTimer({
    super.key,
  });

  @override
  State<GeneralScreenTimer> createState() => _GeneralScreenTimerState();
}

class _GeneralScreenTimerState extends State<GeneralScreenTimer> {
  int _iTimer = 0;
  bool counterStart = true;

  void runCounter(int iCounter) async {
    while (counterStart == true) {
      await Future.delayed(const Duration(seconds: 1), () => iCounter++);
      setState(() {
        _iTimer = iCounter;
      });
    }
  }

  void startCounter(int iTimer) {
    setState(() {
      counterStart = true;
      runCounter(iTimer);
    });
  }

  void stopCounter() {
    setState(() {
      counterStart = false;
    });
  }

  void clearCounter() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "$_iTimer",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(width: 10),
              Text(
                's',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startCounter(_iTimer);
                  // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  //     duration: Duration(milliseconds: 500),
                  //     content: Text("Start")));
                },
                child: const Text("Start"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  stopCounter();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text("Stop")));
                },
                child: const Text("Stop"),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  clearCounter();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(milliseconds: 500),
                      content: Text("Clear")));
                },
                child: const Text("Clear"),
              ),
            ],
          ),
        ],
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
