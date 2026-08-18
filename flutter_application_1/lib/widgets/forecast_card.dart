// с урока 11.8 совместно и после файла bottom_list_view.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  final forecastList = snapshot.data?.list;
  if (forecastList == null || forecastList.isEmpty) {
    return const SizedBox.shrink();
  }

  final dayData = forecastList[index];
  final date = DateTime.fromMillisecondsSinceEpoch(dayData.dt! * 1000);
  final fullDate = Util.getFormattedDate(date);
  final dayOfWeek = fullDate.split(',')[0]; // Tue
  final tempMin = dayData.temp?.min?.toStringAsFixed(0) ?? '--';
  final icon = forecastList[index].getIconUrl();

  return Column(
    mainAxisAlignment: MainAxisAlignment.center, // ← центр по вертикали
    crossAxisAlignment: CrossAxisAlignment.center, // ← центр по горизонтали
    children: <Widget>[
      // День недели
      Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: Text(
          dayOfWeek,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      // Иконка + температура в одной строке
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            icon,
            width: 30,
            height: 30,
            color: Colors.white,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 24, color: Colors.white),
          ),
          const SizedBox(width: 4),
          Text(
            '$tempMin°C',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    ],
  );
}
