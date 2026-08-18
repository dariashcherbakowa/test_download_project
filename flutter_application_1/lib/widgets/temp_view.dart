//получаем иконку и температуру 6 урок

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    // Безопасное извлечение данных
    final forecastList = snapshot.data?.list;
    if (forecastList == null || forecastList.isEmpty) {
      return const SizedBox.shrink();
    }

    final firstDay = forecastList[0];
    final icon = firstDay.getIconUrl();
    final temp = firstDay.temp?.day?.toStringAsFixed(0) ?? '--';
    final description =
        firstDay.weather?[0].description?.toUpperCase() ?? 'Нет данных';

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            icon,
            scale: 0.4,
            color: Colors.black87,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 50),
          ),
          const SizedBox(width: 20.0),
          Column(
            children: <Widget>[
              Text(
                '$temp°C',
                style: const TextStyle(fontSize: 54.0, color: Colors.black87),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 18.0, color: Colors.black87),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
