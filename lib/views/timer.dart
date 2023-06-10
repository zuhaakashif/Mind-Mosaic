import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mind_mosaic1/calender.dart';
import 'package:mind_mosaic1/game.dart';
import 'package:mind_mosaic1/welcome_page.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mind_mosaic1/views/flashcardd.dart';
import 'task_page.dart';
import 'package:mind_mosaic1/views/notesf.dart';

class TimerReel extends StatefulWidget {
  const TimerReel({Key? key}) : super(key: key);

  @override
  _TimerReelState createState() => _TimerReelState();
}

class _TimerReelState extends State<TimerReel> {
  late Timer _timer;
  int _start = 60;
  var _isTimerOn = false;

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Flashh()));
  }

  void _navigateToNextScreen7(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Notess()));
  }

  void _navigateToNextScreen2(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TaskPage()));
  }

  void _navigateToNextScreen3(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Notess()));
  }

  void _navigateToNextScreen6(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SnakeGame()));
  }

  void _navigateToNextScreen5(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const calender()));
  }

  void _navigateToNextScreen4(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WelcomePage(
              email: '',
            )));
  }

  void startTimer() {
    const oneSec = Duration(seconds: 59);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 18, 36),
        elevation: 1,
        title: const Center(
          child: Row(
            children: [
              Text(
                "Timer",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
          icon: Icons.alt_route_rounded,
          backgroundColor: const Color.fromARGB(255, 27, 18, 36),
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
              child: const Icon(Icons.timer),
              label: 'Timer',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () async {
                _navigateToNextScreen(context);
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.list),
              label: 'To-do List',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () async {
                _navigateToNextScreen2(context);
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
              child: const Icon(Icons.games),
              label: 'Game',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () {
                _navigateToNextScreen6(context);
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () {
                _navigateToNextScreen4(context);
              },
            ),
          ]),
      body: Container(
        color: Color.fromARGB(255, 217, 204, 232),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.width * 0.85,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  size: MediaQuery.of(context).size.width * 0.84,
                  customColors: CustomSliderColors(
                    progressBarColor: Color.fromARGB(255, 27, 18, 361),
                    dotColor: Colors.black,
                  ),
                  startAngle: 360,
                  angleRange: 360,
                  customWidths: CustomSliderWidths(
                    trackWidth: 36,
                    progressBarWidth: 22,
                    handlerSize: 7,
                  ),
                ),
                min: 0,
                max: 60,
                initialValue: _start.toDouble(),
                onChange: (double value) {
                  setState(() {
                    _start = value.round();
                  });
                },
                innerWidget: (percentage) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_start.round()}',
                        style: const TextStyle(
                          fontSize: 120,
                          color: Color.fromARGB(255, 27, 18, 36),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "Minutes",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            GestureDetector(
              onTap: () {
                if (_isTimerOn) {
                  _timer.cancel();
                  setState(() {
                    _isTimerOn = false;
                    _start = 60;
                  });
                } else {
                  _isTimerOn = true;
                  startTimer();
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                    color: _isTimerOn
                        ? Colors.redAccent
                        : Color.fromARGB(255, 153, 128, 177),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(2, 4),
                      ),
                    ]),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  _isTimerOn ? 'Stop' : 'Start',
                  style: TextStyle(
                    fontSize: 24,
                    color: _isTimerOn ? Colors.black : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
