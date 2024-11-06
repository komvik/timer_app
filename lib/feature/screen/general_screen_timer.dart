import 'package:flutter/material.dart';

class GeneralScreenTimer extends StatefulWidget {
  const GeneralScreenTimer({
    super.key,
  });

  @override
  State<GeneralScreenTimer> createState() => _GeneralScreenTimerState();
}

class _GeneralScreenTimerState extends State<GeneralScreenTimer> {
  int _iMilisec = 0;
  int _iSec = 0;
  int _iMin = 0;
  List<int> _iTimer = [0, 0, 0];
  bool counterStart = true;

  void runCounter(int iCounter) async {
    while (counterStart == true) {
      await Future.delayed(const Duration(milliseconds: 1), () => iCounter++);
      _iMilisec = iCounter;
      if (_iMilisec > 1000) {
        iCounter = 0;
        _iSec++;
        if (_iSec > 60) {
          _iSec = 0;
          _iMin++;
        }
      }
      if (counterStart) {
        setState(() {
          _iTimer[0] = _iMilisec;
          _iTimer[1] = _iSec;
          _iTimer[2] = _iMin;
        });
      }
    }
  }

  void startCounter(int iTimer) {
    setState(() {
      counterStart = true;
      runCounter(iTimer);
    });
  }

  Future<void> stopCounter() async {
    Future.delayed(
        const Duration(milliseconds: 200), () => counterStart = false);
    setState(() {
      counterStart = false;
    });
  }

  void clearCounter() {
    _iTimer = [0, 0, 0];
    _iMilisec = 0;
    _iSec = 0;
    _iMin = 0;
  }

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
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Text(
                      "${_iTimer[2]}",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: Text(
                      ":",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    child: Text(
                      "${_iTimer[1]}",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                    child: Text(
                      ":",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      "${_iTimer[0]}",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  startCounter(_iTimer[0]);
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
                  stopCounter();
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
