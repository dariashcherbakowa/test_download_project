//доп.файл к уроку  отображение города и даты
//урок 11.5 из курса
//5.1 ступень

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime); // ← Tue, May 5, 2020
  }

  static Widget getItem(Widget icon, int value, String units) {
    return Column(
      children: <Widget>[
        icon, // ← теперь просто используем переданный виджет
        const SizedBox(height: 10.0),
        Text(
          '$value',
          style: const TextStyle(fontSize: 20.0, color: Colors.black87),
        ),
        const SizedBox(height: 10.0),
        Text(
          units,
          style: const TextStyle(fontSize: 15.0, color: Colors.black87),
        ),
      ],
    );
  }
}
