import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mind_mosaic1/calender.dart';
import 'package:mind_mosaic1/views/flashcardd.dart';
import 'task_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mind_mosaic1/views/notesf.dart';

void main() {
  runApp(const Stopwatch());
}

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const StopWatchScreen(),
    );
  }
}

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({Key? key}) : super(key: key);

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  String hoursString = "00", minuteString = "00", secondString = "00";

  int hours = 0, minutes = 0, seconds = 0;
  bool isTimerRunning = false, isResetButtonVisible = false;
  late Timer _timer;

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Flashh()));
  }

  void _navigateToNextScreen2(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TaskPage()));
  }

  void _navigateToNextScreen7(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Notess()));
  }

  void _navigateToNextScreen3(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Notess()));
  }

  void _navigateToNextScreen5(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const calender()));
  }

  void startTimer() {
    setState(() {
      isTimerRunning = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _startSecond();
    });
  }

  void pauseTimer() {
    _timer.cancel();
    setState(() {
      isTimerRunning = false;
    });
    isResetButtonVisible = checkValues();
  }

  void _startSecond() {
    setState(() {
      if (seconds < 59) {
        seconds++;
        secondString = seconds.toString();
        if (secondString.length == 1) {
          secondString = "0" + secondString;
        }
      } else {
        _startMinute();
      }
    });
  }

  void _startMinute() {
    setState(() {
      if (minutes < 59) {
        seconds = 0;
        secondString = "00";
        minutes++;
        minuteString = minutes.toString();
        if (minuteString.length == 1) {
          minuteString = "0" + minuteString;
        }
      } else {
        _starHour();
      }
    });
  }

  void _starHour() {
    setState(() {
      seconds = 0;
      minutes = 0;
      secondString = "00";
      minuteString = "00";
      hours++;
      hoursString = hours.toString();
      if (hoursString.length == 1) {
        hoursString = "0" + hoursString;
      }
    });
  }

  void resetTimer() {
    _timer.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;
      secondString = "00";
      minuteString = "00";
      hoursString = "00";
      isResetButtonVisible = false;
    });
  }

  bool checkValues() {
    if (seconds != 0 || minutes != 0 || hours != 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 18, 36),
        elevation: 1,
        title: const Center(
          child: Text(
            "Stopwatch",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            ),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
          icon: Icons.alt_route_rounded,
          backgroundColor: const Color.fromARGB(255, 153, 128, 177),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.sd_card_alert),
              label: 'Flash',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () async {
                _navigateToNextScreen(context);
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.note),
              label: 'Notes',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () async {
                _navigateToNextScreen7(context);
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.calendar_month_rounded),
              label: 'Calendar',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () {
                _navigateToNextScreen5(context);
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.timer),
              label: 'Stopwatch',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () async {},
            ),
            SpeedDialChild(
              child: const Icon(Icons.list),
              label: 'To-do List',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () async {
                _navigateToNextScreen2(context);
              },
            ),
          ]),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$hoursString:$minuteString:$secondString",
              style: const TextStyle(
                color: Color.fromARGB(255, 27, 18, 36),
                fontSize: 50,
                fontWeight: FontWeight.w500,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 27, 18, 36),
              ),
              onPressed: () {
                if (isTimerRunning) {
                  pauseTimer();
                } else {
                  startTimer();
                }
              },
              child: Text(
                isTimerRunning ? "Pause" : "Play",
              ),
            ),
            isResetButtonVisible
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(2255, 27, 18, 361),
                    ),
                    onPressed: () {
                      resetTimer();
                    },
                    child: const Text("Reset"),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
