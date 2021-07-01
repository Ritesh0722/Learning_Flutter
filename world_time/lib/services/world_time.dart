import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;    // location name for the UI
  String time;        // the time in that location
  String flag;        // url to asset flag icon
  String urlPath;     // location url for API endpoint
  bool isDaytime;     // true or false if daytime or not

  WorldTime ({this.location, this.flag, this.urlPath});

  Future<void> getTime() async {

    try {
      // Request time
      Response response = await get(Uri.https('worldtimeapi.org','/api/timezone/$urlPath'));
      // Converting the json data into Map type
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['datetime'];
      String offsetHr = data['utc_offset'].substring(1,3);
      String offsetMin = data['utc_offset'].substring(4,6);
      // print(datetime);
      // print(offset);

      // Create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetHr), minutes: int.parse(offsetMin)));

      // Set the time property
      isDaytime = now.hour >= 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e) {
      print('caught error: $e');
      time = 'Could not get time data.';
    }
  }
}