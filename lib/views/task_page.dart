import 'package:flutter/material.dart';
import 'package:mind_mosaic1/calender.dart';
import 'package:mind_mosaic1/game.dart';
import 'package:mind_mosaic1/views/flashcardd.dart';
import 'package:mind_mosaic1/views/add_task_view.dart';
import 'package:mind_mosaic1/views/header_view.dart';
import 'package:mind_mosaic1/views/task_info_view.dart';
import 'package:mind_mosaic1/views/task_list_view.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mind_mosaic1/views/notesf.dart';
import 'package:mind_mosaic1/views/timer.dart';
import 'package:mind_mosaic1/welcome_page.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

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
        .push(MaterialPageRoute(builder: (context) => Notess()));
  }

  void _navigateToNextScreen3(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TimerReel()));
  }

  void _navigateToNextScreen5(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const calender()));
  }

  void _navigateToNextScreen6(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SnakeGame()));
  }

  void _navigateToNextScreen4(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WelcomePage(
              email: '',
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: const [
            // Header View
            Expanded(flex: 1, child: HeaderView()),

            // Task Info View
            Expanded(flex: 1, child: TaskInfoView()),
            Expanded(flex: 0, child: AddTaskView()),

            // Task List View
            Expanded(flex: 7, child: TaskListView()),
          ],
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
                _navigateToNextScreen2(context);
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
              child: const Icon(Icons.games),
              label: 'Game',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () {
                _navigateToNextScreen6(context);
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
              child: const Icon(Icons.list),
              label: 'To-do List',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () async {},
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
    );
  }
}
