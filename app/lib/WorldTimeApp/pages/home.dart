import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context).settings.arguments; //get the passed args

    String bgImage = data["isDayTime"] ? "images/day.jpg" : "images/night.jpg";
    Color textColor = data["isDayTime"] ? Colors.black : Colors.white;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(bgImage), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, "/location");
                      setState(() {
                        data = {
                          "time": result["time"],
                          "location": result["location"],
                          "flag": result["flag"],
                          "isDayTime": result["isDayTime"]
                        };
                      });
                    },
                    label: Text(
                      "Choose location",
                      style: TextStyle(fontSize: 20.0, color: textColor),
                    ),
                    icon: Icon(Icons.edit_location, color: textColor)),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: TextStyle(
                        color: textColor,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data["time"],
                  style: TextStyle(
                    color: textColor,
                    fontSize: 64.0,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
