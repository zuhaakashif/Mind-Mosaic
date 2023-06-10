import 'package:mind_mosaic1/calender.dart';
import 'package:mind_mosaic1/game.dart';
import 'package:mind_mosaic1/welcome_page.dart';

import '../flashcard/flashcard.dart';
import '../flashcard/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'task_page.dart';
import 'package:mind_mosaic1/views/notesf.dart';
import 'package:mind_mosaic1/views/timer.dart';

void main() {
  runApp(Flashh());
}

class Flashh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FlashhState();
}

class _FlashhState extends State<Flashh> {
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TaskPage()));
  }

  void _navigateToNextScreen2(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Notess()));
  }

  void _navigateToNextScreen7(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Notess()));
  }

  void _navigateToNextScreen3(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const TimerReel()));
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

  final List<FlashCard> _flashcards = [
    FlashCard(
        question: "What is the difference between list and tuples in Python?",
        answer:
            "Lists are mutable i.e they can be edited and Tuples are immutable (tuples are lists which can’t be edited)."),
    FlashCard(
        question:
            "________ of an algorithm refers to defining the mathematical boundation/framing of its run-time performance.",
        answer: " Asymptotic analysis"),
    FlashCard(
        question:
            "__________ is the formal way to express the upper bound of an algorithm's running time.",
        answer: "Big Oh Notation"),
    FlashCard(
        question: "Ο(log n) is?", answer: "logarithmic asymptotic notations"),
    FlashCard(
        question:
            "The Theta notation is the formal way to express ____________ of an algorithm's running time.",
        answer: " lower bound and upper bound"),
    FlashCard(
        question: "What is the implicit return type of constructor?",
        answer: " A class object in which it is defined"),
    FlashCard(
        question:
            "Under which pillar of OOPS do base class and derived class relationships come?",
        answer: "Inheritance"),
    FlashCard(
        question: "A derived class is also called a _______.",
        answer: "Subclass"),
    FlashCard(
        question:
            "Hierarchical inheritance could be some subset of _________ inheritance.",
        answer: "Hybrid"),
    FlashCard(
        question:
            "What is the name of the feature in which we enforce the definitions of the abstract function at the compile time?",
        answer: "Dynamic Polymorphism"),
    FlashCard(
        question: "Dijkstra’s algorithm is used to solve __________  problems?",
        answer: "Single source shortest path"),
    FlashCard(
        question:
            "When a pop() operation is called on an empty queue, what is the condition called?",
        answer: "Underflow"),
    FlashCard(
        question:
            " What is the time complexity of the binary search algorithm?",
        answer: "O(log2n)"),
    FlashCard(
        question: "The worst-case time complexity of Quicksort is?",
        answer: "O(n^2)"),
    FlashCard(
        question:
            "The worst-case time complexity of Selection Exchange Sort is?",
        answer: "O(n^2)"),
    FlashCard(
        question: "Heap is a _____________?", answer: "Complete binary tree"),
    FlashCard(
        question:
            "Worst-case time complexity to access an element in a BST can be?",
        answer: "O(n)"),
  ];

  late int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FLASHCARD",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 27, 18, 36),
          elevation: 1,
          title: const Center(
            child: Text(
              "Flash-Card",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 5,
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 212, 189, 241),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColoredBox(
                color: const Color.fromARGB(255, 27, 18, 36),
                child: SizedBox(
                    width: 270,
                    height: 270,
                    child: FlipCard(
                        front: FlashCardView(
                          text: _flashcards[_currentIndex].question,
                        ),
                        back: FlashCardView(
                          text: _flashcards[_currentIndex].answer,
                        ))),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Color.fromARGB(2255, 27, 18, 36),
                    ),
                    label: const Text(
                      "Prev",
                      style: TextStyle(
                        color: Color.fromARGB(255, 27, 18, 36),
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: const Icon(
                      Icons.chevron_right,
                      color: Color.fromARGB(255, 27, 18, 36),
                    ),
                    label: const Text(
                      "Next",
                      style: TextStyle(
                        color: Color.fromARGB(255, 27, 18, 36),
                      ),
                    ),
                  ),
                ],
              )
            ],
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
                onTap: () {},
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
                child: const Icon(Icons.home),
                label: 'Home',
                backgroundColor: const Color.fromARGB(255, 153, 128, 177),
                onTap: () {
                  _navigateToNextScreen4(context);
                },
              ),
            ]),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex + 1 < _flashcards.length ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
