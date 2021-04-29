import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[200],
        appBar: AppBar(
          title: Text(
            "Practice App",
            style: TextStyle(
              fontFamily: "EmilysCandy",
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Text(
            "helloo",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.white,
                fontFamily: "EmilysCandy"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => null,
          child: Text(
            "+",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
