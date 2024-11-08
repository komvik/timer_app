import 'package:flutter/material.dart';
import 'package:timer_app/feature/widget/lettering_widget.dart';

class GeneralScreenTimer extends StatefulWidget {
  const GeneralScreenTimer({
    super.key,
  });

  @override
  State<GeneralScreenTimer> createState() => _GeneralScreenTimerState();
}

class _GeneralScreenTimerState extends State<GeneralScreenTimer> {
  TextEditingController secController = TextEditingController();

  List<String> inputZeit = ["Timer", "Countdown in Millisekunden."];
  List<String> textBtnStart = ["Start Timer", "Start Coutdown"];
  List<String> textBtnStop = ["Stop Timer", "Stop Coutdown"];
  int indexSwitch = 0;
  int decrimentCountDown = 0; //decrement number in CountDown for StopFunktion

// _____ Variable for CountDown

// ______ Variable for Timer
  int _iMilisec = 0;
  int _iSec = 0;
  int _iMin = 0;
  List<int> _iTimer = [0, 0, 0];
  bool counterStart = true;

// FUTURE ___________________________ runCounter
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

// FUTURE ___________________________ runCountDown
  void runCountdown(int iCounter) async {
    while (counterStart == true && iCounter >= 0) {
      if (iCounter <= 0) {
        counterStart = false;
        clearCountDown();
        //  print("STOPP");
        break;
      }
      // print("COUNTER: $iCounter");
      await Future.delayed(const Duration(milliseconds: 1));
      iCounter--;
      decrimentCountDown = iCounter;
      int miilisekundenRest = iCounter % 1000;
      int sekundenRest = ((iCounter % 60000) / 1000).floor();
      int minutenRest = (iCounter / 60000).floor();

      // print("$minutenRest:$sekundenRest:$miilisekundenRest");

      if (counterStart) {
        setState(() {
          _iTimer[0] = miilisekundenRest;
          _iTimer[1] = sekundenRest;
          _iTimer[2] = minutenRest;
        });
      }
    }
  }

// ___________________________________ OnChange
  secundenOnChange(bool changed) {
    setState(() {
      if (changed) {
        indexSwitch = 1;

        stopCounter();
        clearCounter();
      } else {
        indexSwitch = 0;
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

// FUTURE ___________________________ Timer Stop
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
  void startCounDown(int iTimer) {
    setState(() {
      counterStart = true;
      runCountdown(iTimer);
    });
  }

// __________________________________ CountDown Stop
  void stopCountDown() {
    setState(() {
      stopCounter();
    });
  }

// __________________________________ CountDown Clear
  void clearCountDown() {
    setState(() {
      secController.text = "";

      decrimentCountDown = 0;
      clearCounter();
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
          Text(
            inputZeit[indexSwitch],
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 150,
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
                      const LetteringWidget(chr: "min."),
                      SizedBox(
                        width: 70,
                        child: Text(
                          "${_iTimer[1]}",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      const LetteringWidget(chr: "sec."),
                      SizedBox(
                        width: 110,
                        child: Text(
                          "${_iTimer[0]}",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      const LetteringWidget(chr: "ms."),
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
                        if (decrimentCountDown != 0) {
                          startCounDown(decrimentCountDown);
                        } else {
                          startCounDown(int.parse(secController.text));
                        }
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
