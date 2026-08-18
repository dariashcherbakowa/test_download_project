//4. здесь пишем экран с использованием stateful виджета
// успешно подключила API и получила данные! тк на выводе в консполи:
// 1    Приложение запустилось
// 2    Отправило запрос к API
// 3    Получило ответ с погодой в Лондоне
// 4    Распечатало "Clouds" (первая погода)
// 5    Код работает ✅

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/weather_api.dart';
import 'package:flutter_application_1/models/weather_forecast_daily.dart';
import 'package:flutter_application_1/screens/city_screen.dart';
import 'package:flutter_application_1/widgets/bottom_list_view.dart';
import 'package:flutter_application_1/widgets/city_view.dart';
import 'package:flutter_application_1/widgets/detail_view.dart';
import 'package:flutter_application_1/widgets/temp_view.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WeatherForecastScreen extends StatefulWidget {
  final WeatherForecast? locationWeather;

  const WeatherForecastScreen({super.key, this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = "London";

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    } else {
      forecastObject = WeatherApi().fetchWeatherForecast(cityName: _cityName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          "openweathermap.org",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.my_location, color: Colors.white),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast(
                cityName: _cityName,
              );
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.location_city, color: Colors.white),
            onPressed: () async {
              var tappedName = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CityScreen()),
              );
              if (tappedName != null && tappedName.isNotEmpty) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi().fetchWeatherForecast(
                    cityName: _cityName,
                  );
                });
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<WeatherForecast>(
        future: forecastObject,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Ошибка: ${snapshot.error}',
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                const SizedBox(height: 50.0),
                CityView(snapshot: snapshot),
                const SizedBox(height: 50.0),
                TempView(snapshot: snapshot),
                const SizedBox(height: 50.0),
                DetailView(snapshot: snapshot),
                const SizedBox(height: 50.0),
                BottomListView(snapshot: snapshot),
              ],
            );
          }
          return const Center(
            child: SpinKitDoubleBounce(color: Colors.black87, size: 100.0),
          );
        },
      ),
    );
  }
}
