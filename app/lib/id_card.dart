import 'package:flutter/material.dart';

class IDCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text("ID Card"),
        backgroundColor: Colors.pink[400],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[_Name(), _Surname(), _Email()],
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "NAME",
          style: TextStyle(letterSpacing: 2.0, color: Colors.white),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Bertaç",
          style: TextStyle(
              letterSpacing: 2.0,
              color: Colors.amber,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class _Surname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "SURNAME",
          style: TextStyle(letterSpacing: 2.0, color: Colors.white),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Severcan",
          style: TextStyle(
              letterSpacing: 2.0,
              color: Colors.amber,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.email,
          color: Colors.white,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          "bertac.severcan@gmail.com",
          style: TextStyle(
              color: Colors.amber,
              letterSpacing: 1.0,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
