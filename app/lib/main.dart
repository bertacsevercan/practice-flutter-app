import 'package:flutter/material.dart';
import 'id_card.dart';
import 'WorldTimeApp/pages/home.dart';
import 'WorldTimeApp/pages/loading.dart';
import 'WorldTimeApp/pages/choose_location.dart';
import 'web_socket_demo.dart';
import 'package:web_socket_channel/io.dart';

String test_uri = 'wss://echo.websocket.org';
void main() => runApp(MaterialApp(
      home: WebSocketDemo(
        channel: IOWebSocketChannel.connect("ws://localhost:3000"),
      ),
      /* initialRoute: "/",
      routes: {
        "/": (context) => Loading(),
        "/home": (context) => Home(),
        "/location": (context) => ChooseLocation(),
      }, */
    ));

class _Home extends StatelessWidget {
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
      body: _Expanded(), //Center(child: _Padding()),
      floatingActionButton: _FloatingActionButton(),
    );
  }
}

class _Expanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: _AssetImage()),
        Expanded(flex: 1, child: _Container()),
        Expanded(flex: 1, child: _Container()),
        Expanded(flex: 1, child: _Container()),
      ],
    );
  }
}

class RowsAndCols extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _Column(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _Column(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _Column(),
        )
      ],
    );
  }
}

class _Row extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[_Text(), _Container(), _ElevatedButton()],
    );
  }
}

class _Column extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[_Text(), _Container(), _ElevatedButton()],
    );
  }
}

class _Text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "helloo",
      style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color: Colors.white,
          fontFamily: "EmilysCandy"),
    );
  }
}

class _Container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      //color: Colors.red,
      child: Text("hi!!"),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(bottom: 10.0),
    );
  }
}

class _Padding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 100.0),
        child: Text("padded text"));
  }
}

class _FloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => print("Honk!"),
      child: Icon(
        Icons.airport_shuttle,
        color: Colors.lightBlue[200],
        size: 30.0,
      ),
      backgroundColor: Colors.pink,
    );
  }
}

class _AssetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Image.asset("images/lollipop.jpg");
}

class _NetworkImage extends StatelessWidget {
  final imgSrc =
      "https://images.unsplash.com/photo-1514517521153-1be72277b32f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80";
  @override
  Widget build(BuildContext context) => Image.network(imgSrc);
}

class _ElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      //TextButton, IconButton...
      icon: Icon(Icons.drag_handle),
      label: Text("Tap me"),
      onPressed: () => print("Tapped"),
    );
  }
}

class _IconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.drag_handle),
      iconSize: 30.0,
      color: Colors.pink,
      onPressed: () => print("Tapped"),
    );
  }
}
