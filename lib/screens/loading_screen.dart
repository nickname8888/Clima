import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const String apiKey = 'b1793cd606ed7cee0603d86141386c9f';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    //get user's location
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    var url =
        "http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var locationData = await networkHelper.getWeatherData();
    print(locationData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
