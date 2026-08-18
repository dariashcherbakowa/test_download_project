//урок 11.8 - отображение прокрутки прогноза за неделю

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_forecast_daily.dart';
import 'package:flutter_application_1/widgets/forecast_Card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final forecastList = snapshot.data?.list;
    if (forecastList == null || forecastList.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width / 2.7,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: forecastCard(snapshot, index),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: forecastList.length,
          ),
        ),
      ],
    );
  }
}
