import 'package:flutter/material.dart';
import "package:http/http.dart";
import 'dart:convert';
import 'package:app/WorldTimeApp/services/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";
  @override
  void initState() {
    //runs every state creation once.
    super.initState();
    setupWorldTime();
  }

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
    await instance.getTime();
    Map arguments = {
      "location": instance.location,
      "time": instance.time,
      "flag": instance.flag
    };

    Navigator.pushReplacementNamed(context, "/home", arguments: arguments);
    /*  setState(() {
      time = instance.time;
    }); */
  }

  void getData() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Map data = jsonDecode(response.body);
    print(data);
    print(data["title"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text("$time"),
      ),
    );
  }
}
