import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  final imgSrc =
      "https://images.unsplash.com/photo-1514517521153-1be72277b32f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: ElevatedButton.icon(
        //TextButton, IconButton...
        icon: Icon(Icons.drag_handle),
        label: Text("Tap me"),
        onPressed: () => print("Tapped"),
      ) //Image.asset("images/lollipop.jpg"),
          /* Text(
          "helloo",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.white,
              fontFamily: "EmilysCandy"),
        ), */
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("Honk!"),
        child: Icon(
          Icons.airport_shuttle,
          color: Colors.lightBlue[200],
          size: 30.0,
        ),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
