//11.7 Отображение давления, осадков и ветра

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather_forecast_daily.dart';
import 'package:flutter_application_1/utilities/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final forecastList = snapshot.data?.list;
    if (forecastList == null || forecastList.isEmpty) {
      return const SizedBox.shrink();
    }

    final pressure = (forecastList[0].pressure ?? 0) * 0.750062;
    final humidity = forecastList[0].humidity ?? 0;
    final wind = forecastList[0].speed ?? 0;

    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Util.getItem(
            FaIcon(
              FontAwesomeIcons.thermometer,
              size: 28.0,
              color: Colors.black87,
            ),
            pressure.round(),
            'mm Hg',
          ),
          Util.getItem(
            FaIcon(
              FontAwesomeIcons.cloudRain,
              size: 28.0,
              color: Colors.black87,
            ),
            humidity,
            '%',
          ),
          Util.getItem(
            FaIcon(FontAwesomeIcons.wind, size: 28.0, color: Colors.black87),
            wind.toInt(),
            'm/s',
          ),
        ],
      ),
    );
  }
}
