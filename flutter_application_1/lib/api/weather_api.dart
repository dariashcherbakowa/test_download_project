import 'dart:convert';
import 'dart:developer';
import 'package:flutter_application_1/models/weather_forecast_daily.dart';
import 'package:flutter_application_1/utilities/constants.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity({
    required String cityName,
  }) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.http(
      Constants.WEATHER_URL_DOMAIN,
      Constants.WEATHER_FORECAST_PATH,
      queryParameters,
    );

    log('request ${uri.toString()}');

    var response = await http.get(uri);

    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error.response');
    }
  }

  Future<WeatherForecast> fetchWeatherForecast({
    required String cityName,
  }) async {
    return fetchWeatherForecastWithCity(cityName: cityName);
  }
}
