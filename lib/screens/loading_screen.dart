import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    Location location = Location();

    await location.getCurrentLocation();

    // print(location.latitude);
    // print(location.longitude);
  }

  void getData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=London,uk&callback=test&appid=53ae74e992cf5d115dadab5170a3db90'));

    // print(response.body);

    if (response.statusCode == 200) {
      String data = response.body;

      var longitude = jsonDecode(data)['weather'][0]['description'];
      print(longitude);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(

        // body: Center(
        //   child: RaisedButton(
        //     onPressed: () {
        //       getLocation();
        //     },
        //     child: Text('Get Location'),
        //   ),
        // ),
        );
  }
}
