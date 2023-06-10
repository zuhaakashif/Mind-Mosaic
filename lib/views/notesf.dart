// ignore: unused_import
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mind_mosaic1/calender.dart';
import 'package:mind_mosaic1/game.dart';
import 'package:mind_mosaic1/views/flashcardd.dart';
import 'package:mind_mosaic1/welcome_page.dart';
import 'task_page.dart';
import 'package:mind_mosaic1/views/timer.dart';

void main() => runApp(Notess());

class Notess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: Color.fromARGB(255, 212, 189, 241),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";
  List notes = [];

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Flashh()));
  }

  void _navigateToNextScreen2(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TaskPage()));
  }

  void _navigateToNextScreen3(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TimerReel()));
  }

  void _navigateToNextScreen7(BuildContext context) {
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

  @override
  void initState() {
    notes.add("You can remove me if you want");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 18, 36),
          elevation: 1,
          title: const Center(
            child: Row(
              children: [
                Text(
                  "Notes",
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
          leading: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Color.fromARGB(255, 217, 204, 232),
                      title: const Text("Add Notes"),
                      content: TextField(
                        decoration: const InputDecoration(hintText: "Notes"),
                        onChanged: (String value) {
                          input = value;
                        },
                      ),
                      actions: [
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              notes.add(input);
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Add",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    );
                  });
            },
          ),
        ),
        floatingActionButton: SpeedDial(
            icon: Icons.alt_route_rounded,
            backgroundColor: const Color.fromARGB(255, 27, 18, 36),
            children: [
              SpeedDialChild(
                child: const Icon(Icons.sd_card_alert),
                label: 'Flash',
                backgroundColor: Color.fromARGB(255, 153, 128, 177),
                onTap: () async {
                  _navigateToNextScreen(context);
                },
              ),
              SpeedDialChild(
                child: const Icon(Icons.note),
                label: 'Notes',
                backgroundColor: const Color.fromARGB(255, 153, 128, 177),
                onTap: () async {
                  _navigateToNextScreen7;
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
                onTap: () async {
                  _navigateToNextScreen2(context);
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
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: UniqueKey(),
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Text(
                      notes[index],
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Color.fromARGB(255, 139, 31, 23),
                      ),
                      onPressed: () {
                        setState(() {
                          notes.removeAt(index);
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
