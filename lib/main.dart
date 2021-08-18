import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game_engine.dart';

void main() {
  runApp(GameWidget(
    game: GameEngine(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Dungeon Crawler',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: MyHomePage(title: 'Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          GameWidget(
            game: GameEngine(),
          )
        ]),
      ),
    );
  }
}
