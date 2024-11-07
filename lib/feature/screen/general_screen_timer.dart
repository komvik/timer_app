import 'package:flutter/material.dart';

class GeneralScreenTimer extends StatefulWidget {
  const GeneralScreenTimer({
    super.key,
  });

  @override
  State<GeneralScreenTimer> createState() => _GeneralScreenTimerState();
}

class _GeneralScreenTimerState extends State<GeneralScreenTimer> {
  TextEditingController secController = TextEditingController();

  List<String> inputZeit = ["Timer", "CountDown"];
  List<String> textBtnStart = ["Start Timer", "Start Coutdown"];
  List<String> textBtnStop = ["Stop Timer", "Stop Coutdown"];
  int indexSwitch = 0;

// _____ Variable for CountDown

  String showSec = "sec";

// ______ Variable for Timer
  int _iMilisec = 0;
  int _iSec = 0;
  int _iMin = 0;
  List<int> _iTimer = [0, 0, 0];
  bool counterStart = true;

  void runCounter(int iCounter) async {
    while (counterStart == true) {
      await Future.delayed(const Duration(milliseconds: 1), () => iCounter++);
      _iMilisec = iCounter;
      if (_iMilisec > 999) {
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

// ___________________________________ OnChange
  secundenOnChange(bool changed) {
    setState(() {
      if (changed) {
        indexSwitch = 1;
        showSec = secController.text;
        stopCounter();
        clearCounter();
      } else {
        indexSwitch = 0;
        showSec = "sec";
      }
    });
  }

// __________________________________ Timer Start
  void startCounter(int iTimer) {
    setState(() {
      counterStart = true;
      runCounter(iTimer);
    });
  }

// __________________________________ Timer Stop
  Future<void> stopCounter() async {
    Future.delayed(
        const Duration(milliseconds: 200), () => counterStart = false);
    setState(() {
      counterStart = false;
    });
  }

// __________________________________ Timer Clear
  void clearCounter() {
    _iTimer = [0, 0, 0];
    _iMilisec = 0;
    _iSec = 0;
    _iMin = 0;
  }

// __________________________________ CountDown Start
  void runCountDown() {
    setState(() {
      inputZeit[1] = "Start Count Down";
    });
  }

// __________________________________ CountDown Stop

  void stopCountDown() {
    setState(() {
      inputZeit[1] = "Stop Count Down";
    });
  }

// __________________________________ CountDown Clear

  void clearCountDown() {
    setState(() {
      secController.text = "";
      showSec = "";
      secundenOnChange(false);
    });
  }

//==============================================================================

//==============================================================================
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(inputZeit[indexSwitch]),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: secController,
                  onChanged: (text) {
                    secundenOnChange(text.isNotEmpty);
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          //============
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: Text(showSec),
              ),
            ],
          ),
          //===========
          const SizedBox(height: 100),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 65,
                        child: Text(
                          "${_iTimer[2]}",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Container(
                        color: Colors.amber,
                        child: SizedBox(
                          width: 60,
                          child: Text(
                            "min.",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 65,
                        child: Text(
                          "${_iTimer[1]}",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Container(
                        color: Colors.amber,
                        child: SizedBox(
                          width: 60,
                          child: Text(
                            "sec.",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          "${_iTimer[0]}",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Container(
                        color: Colors.amber,
                        child: SizedBox(
                          width: 50,
                          child: Text(
                            "ms.",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (indexSwitch == 0) {
                        startCounter(_iTimer[0]);
                        // ScaffoldMessenger.of(context).showSnackBar(
                        // const SnackBar( duration: Duration(milliseconds: 500), content: Text("Start")));
                      } else {
                        runCountDown();
                      }
                    },
                    child: Text(textBtnStart[indexSwitch]),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (indexSwitch == 0) {
                        stopCounter();
                      } else {
                        stopCountDown();
                      }
                    },
                    child: Text(textBtnStop[indexSwitch]),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (indexSwitch == 0) {
                        stopCounter();
                        clearCounter();
                      } else {
                        clearCountDown();
                      }
                    },
                    child: const Text("Clear"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
