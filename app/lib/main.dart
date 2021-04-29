import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[300],
        appBar: AppBar(
          title: Text("Practice App"),
        ),
        body: Center(
          child: Text("helloo"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("+"),
        ),
      ),
    );
  }
}
