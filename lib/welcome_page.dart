import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
//import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:mind_mosaic1/auth_controller.dart';
import 'package:mind_mosaic1/calender.dart';
import 'package:mind_mosaic1/game.dart';
import 'package:mind_mosaic1/views/flashcardd.dart';
import 'package:mind_mosaic1/views/notesf.dart';
import 'package:mind_mosaic1/views/task_page.dart';
import 'package:mind_mosaic1/views/timer.dart';

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Flashh()));
}

void _navigateToNextScreen2(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const TaskPage()));
}

void _navigateToNextScreen3(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const TimerReel()));
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

void _navigateToNextScreen7(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notess()));
}

void _navigateToNextScreen6(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SnakeGame()));
}

// ignore: must_be_immutable
class WelcomePage extends StatelessWidget {
  String email;
  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: SpeedDial(
          icon: Icons.alt_route_rounded,
          backgroundColor: Color.fromARGB(255, 27, 18, 36),
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
                _navigateToNextScreen3(context);
              },
            ),
            SpeedDialChild(
              child: const Icon(Icons.list),
              label: 'To-Do List',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () {
                _navigateToNextScreen(context);
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
          ]),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
              width: w,
              height: h * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/background.png"),
                      fit: BoxFit.fill)),
              child: Stack(children: <Widget>[
                Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('img/light-1.png'))),
                    )),
                Positioned(
                    left: 130,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('img/light-2.png'))),
                    )),
                Positioned(
                    right: 16,
                    top: 25,
                    width: 80,
                    height: 110,
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('img/clock.png'))),
                    )),
              ])),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome!",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 20, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "This app is currently under development. Please cooperate :)",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          GestureDetector(
            onTap: () {
              AuthController.instance.logOut();
            },
            child: Container(
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage("img/loginbtn5.jpeg"),
                      fit: BoxFit.fill)),
              child: const Center(
                child: Text(
                  "Sign out",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
