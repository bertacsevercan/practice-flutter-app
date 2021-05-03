import 'package:flutter/material.dart';
import "package:http/http.dart";
import 'dart:convert';
import 'package:app/WorldTimeApp/services/WorldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      "flag": instance.flag,
      "isDayTime": instance.isDayTime,
    };

    Navigator.pushReplacementNamed(context, "/home", arguments: arguments);
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
        backgroundColor: Colors.green,
        body: Center(
          child: SpinKitThreeBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ));
  }
}
