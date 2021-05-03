import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  void initState() {
    //runs every state creation once.
    // TODO: implement initState
    super.initState();
    print("initState ran");
  }

  @override
  Widget build(BuildContext context) {
    //runs in every build.
    print("build ran");
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Choose Location"),
      ),
      body: Text("Choose location"),
    );
  }
}
