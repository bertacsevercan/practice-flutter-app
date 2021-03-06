import "package:http/http.dart";
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDayTime;

  WorldTime({this.location, this.flag, this.url});

  Map<String, String> headers = {
    'Content-Type': 'application/json;charset=UTF-8',
    'Charset': 'utf-8'
  };

  Future<void> getTime() async {
    try {
      print("Getting data...");
      Response response = await get(
          Uri.parse("https://worldtimeapi.org/api/timezone/$url"),
          headers: headers);
      Map data = jsonDecode(response.body);

      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1, 3);
      //print(datetime + offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //time = now.toString();
      time = DateFormat.jm().format(now);

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      print("Got the data.");
    } catch (e) {
      print("Error: $e");
      time = "could not get time";
      isDayTime = true;
    }
  }
}
