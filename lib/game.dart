import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mind_mosaic1/calender.dart';
import 'package:mind_mosaic1/views/flashcardd.dart';
import 'package:mind_mosaic1/views/notesf.dart';
import 'package:mind_mosaic1/views/task_page.dart';
import 'package:mind_mosaic1/views/timer.dart';
import 'dart:math';
import 'dart:async';

import 'package:mind_mosaic1/welcome_page.dart';

void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Flashh()));
}

void _navigateToNextScreen7(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notess()));
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

class SnakeGame extends StatefulWidget {
  const SnakeGame({super.key});

  @override
  _SnakeGameState createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  final int squaresPerRow = 20;
  final int squaresPerCol = 40;
  final fontStyle = TextStyle(color: Colors.white, fontSize: 20);
  final randomGen = Random();

  var snake = [
    [0, 1],
    [0, 0]
  ];
  var food = [0, 2];
  var direction = 'up';
  var isPlaying = false;
  void startGame() {
    const duration = Duration(milliseconds: 200);

    snake = [
      // Snake head
      [(squaresPerRow / 2).floor(), (squaresPerCol / 2).floor()]
    ];

    snake.add([snake.first[0], snake.first[1] + 1]); // Snake body

    createFood();

    isPlaying = true;
    Timer.periodic(duration, (Timer timer) {
      moveSnake();
      if (checkGameOver()) {
        timer.cancel();
        endGame();
      }
    });
  }

  void moveSnake() {
    setState(() {
      switch (direction) {
        case 'up':
          snake.insert(0, [snake.first[0], snake.first[1] - 1]);
          break;

        case 'down':
          snake.insert(0, [snake.first[0], snake.first[1] + 1]);
          break;

        case 'left':
          snake.insert(0, [snake.first[0] - 1, snake.first[1]]);
          break;

        case 'right':
          snake.insert(0, [snake.first[0] + 1, snake.first[1]]);
          break;
      }

      if (snake.first[0] != food[0] || snake.first[1] != food[1]) {
        snake.removeLast();
      } else {
        createFood();
      }
    });
  }

  void createFood() {
    food = [randomGen.nextInt(squaresPerRow), randomGen.nextInt(squaresPerCol)];
  }

  bool checkGameOver() {
    if (!isPlaying ||
        snake.first[1] < 0 ||
        snake.first[1] >= squaresPerCol ||
        snake.first[0] < 0 ||
        snake.first[0] > squaresPerRow) {
      return true;
    }

    for (var i = 1; i < snake.length; ++i) {
      if (snake[i][0] == snake.first[0] && snake[i][1] == snake.first[1]) {
        return true;
      }
    }

    return false;
  }

  void endGame() {
    isPlaying = false;

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text(
              'Score: ${snake.length - 2}',
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
          icon: Icons.alt_route_rounded,
          backgroundColor: Color.fromARGB(255, 119, 81, 158),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.sd_card_alert),
              label: 'Flash',
              backgroundColor: const Color.fromARGB(255, 153, 128, 177),
              onTap: () {
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
                _navigateToNextScreen2(context);
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
      backgroundColor: Color.fromARGB(255, 212, 189, 241),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (direction != 'up' && details.delta.dy > 0) {
                  direction = 'down';
                } else if (direction != 'down' && details.delta.dy < 0) {
                  direction = 'up';
                }
              },
              onHorizontalDragUpdate: (details) {
                if (direction != 'left' && details.delta.dx > 0) {
                  direction = 'right';
                } else if (direction != 'right' && details.delta.dx < 0) {
                  direction = 'left';
                }
              },
              child: AspectRatio(
                aspectRatio: squaresPerRow / (squaresPerCol + 5),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: squaresPerRow,
                    ),
                    itemCount: squaresPerRow * squaresPerCol,
                    itemBuilder: (BuildContext context, int index) {
                      var color;
                      var x = index % squaresPerRow;
                      var y = (index / squaresPerRow).floor();

                      bool isSnakeBody = false;
                      for (var pos in snake) {
                        if (pos[0] == x && pos[1] == y) {
                          isSnakeBody = true;
                          break;
                        }
                      }
                      if (snake.first[0] == x && snake.first[1] == y) {
                        color = Colors.white;
                      } else if (isSnakeBody) {
                        color = Colors.grey;
                      } else if (food[0] == x && food[1] == y) {
                        color = Color.fromARGB(255, 255, 0, 0);
                      } else {
                        color = Color.fromARGB(255, 42, 42, 42);
                      }

                      return Container(
                        margin: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: isPlaying
                            ? Colors.red
                            : Color.fromARGB(255, 119, 81, 158),
                      ),
                      //color: isPlaying ? Colors.red : Colors.blue,
                      child: Text(
                        isPlaying ? 'End' : 'Start',
                        style: fontStyle,
                      ),
                      onPressed: () {
                        if (isPlaying) {
                          isPlaying = false;
                        } else {
                          startGame();
                        }
                      }),
                  Text(
                    'Score: ${snake.length - 2}   ',
                    style: fontStyle,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
