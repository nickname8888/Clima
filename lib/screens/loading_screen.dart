import 'package:clima/api_keys.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    //get user's location
    Location location = Location();
    await location.getCurrentLocation();

    var url =
        "http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var locationData = await networkHelper.getWeatherData();
    // print(locationData);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherData: locationData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitWave(
        color: Colors.white,
        size: 100.0,
      ),
    ));
  }
}
