import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments; //get the passed args
    print(data);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextButton.icon(
                onPressed: () => Navigator.pushNamed(context, "/location"),
                label: Text("Choose location"),
                icon: Icon(Icons.edit_location))
          ],
        ),
      ),
    );
  }
}
