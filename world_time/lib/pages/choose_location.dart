import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(urlPath: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(urlPath: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(urlPath: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(urlPath: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(urlPath: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(urlPath: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(urlPath: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(urlPath: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}