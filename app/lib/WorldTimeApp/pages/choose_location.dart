import 'package:flutter/material.dart';
import 'package:app/WorldTimeApp/services/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Map arguments = {
      "location": instance.location,
      "time": instance.time,
      "flag": instance.flag,
      "isDayTime": instance.isDayTime,
    };

    Navigator.pop(context, arguments);
  }

  @override
  Widget build(BuildContext context) {
    //runs in every build.
    print("build ran");
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        title: Text("Choose Location"),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                tileColor: Colors.green[200],
                onTap: () => {updateTime(index)},
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("images/${locations[index].flag}"),
                ),
                title: Text(locations[index].location),
              ),
            ),
          );
        },
      ),
    );
  }
}
