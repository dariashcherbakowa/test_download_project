//урок 11.10 ч2

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/weather_api.dart';
import 'package:flutter_application_1/screens/weather_forecast_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    try {
      var weatherInfo = await WeatherApi().fetchWeatherForecastWithCity(
        cityName: 'London',
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              WeatherForecastScreen(locationWeather: weatherInfo),
        ),
      );
    } catch (e) {
      print('Ошибка: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.black87, size: 100.0),
      ),
    );
  }
}
