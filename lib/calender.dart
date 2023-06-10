import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mind_mosaic1/game.dart';
import 'package:mind_mosaic1/views/flashcardd.dart';
import 'package:mind_mosaic1/views/notesf.dart';
import 'package:mind_mosaic1/views/task_page.dart';
import 'package:mind_mosaic1/views/timer.dart';
import 'package:mind_mosaic1/welcome_page.dart';
import 'package:table_calendar/table_calendar.dart';

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

void _navigateToNextScreen6(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SnakeGame()));
}

void _navigateToNextScreen7(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notess()));
}

void _navigateToNextScreen4(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => WelcomePage(
            email: '',
          )));
}

void _navigateToNextScreen5(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const calender()));
}

class calender extends StatefulWidget {
  const calender({super.key});

  @override
  State<calender> createState() => _calenderState();
}

class _calenderState extends State<calender> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 18, 36),
          elevation: 1,
          title: Text('Calender')),
      body: content(),
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
          ]),
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text('Selected Day: ' + today.toString().split(" ")[0]),
          Container(
            child: TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
          )
        ],
      ),
    );
  }
}
