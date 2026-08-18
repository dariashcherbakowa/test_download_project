//5. отображение города и даты
//урок 11.5 из курса

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_forecast_daily.dart';
import 'package:flutter_application_1/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot; // ← поле

  const CityView({super.key, required this.snapshot}); // ← конструктор

  @override
  Widget build(BuildContext context) {
    // Исправлено: snapchot → snapshot
    final forecastList = snapshot.data?.list ?? [];
    final city = snapshot.data?.city?.name ?? 'Unknown';
    final country = snapshot.data?.city?.country ?? '';

    // Исправлено: formatteDate → formattedDate
    final formattedDate = forecastList.isNotEmpty
        ? DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt! * 1000)
        : DateTime.now();

    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '$city, $country',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              color: Colors.black87,
            ),
          ),
          Text(
            Util.getFormattedDate(
              formattedDate,
            ), // ← исправлено название метода
            style: const TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
