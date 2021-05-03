import 'package:flutter/material.dart';
import "package:http/http.dart";
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    //runs every state creation once.
    // TODO: implement initState
    super.initState();
    // getData();
    getTime();
  }

  void getData() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Map data = jsonDecode(response.body);
    print(data);
    print(data["title"]);
  }

  void getTime() async {
    print(000);
    Response response = await get(
        Uri.parse("https://worldtimeapi.org/api/timezone/Europe/Istanbul"));
    Map data = jsonDecode(response.body);

    String datetime = data["datetime"];
    String offset = data["utc_offset"].substring(1, 3);
    //print(datetime + offset);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
    print(111);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading..."),
    );
  }
}
