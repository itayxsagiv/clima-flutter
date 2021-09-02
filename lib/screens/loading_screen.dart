import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url = 'https://samples.openweathermap.org/data/2.5/weather?'
        'lat=${location.latitude}&lon=${location.longitude}'
        '&appid=$apiKey';
    print(url);
    NetworkHelper networkHelper = NetworkHelper(url);
    var decodedData = await networkHelper.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(
            locationWeather: decodedData,
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
