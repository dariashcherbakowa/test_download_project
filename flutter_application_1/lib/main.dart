// 3. подготовим наш UI для вывода информации о погоде

// Импортируем пакет Flutter для работы с виджетами и интерфейсом
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/location_screen.dart';

// Импортируем экран с прогнозом погоды (главный виджет приложения)
//import 'package:flutter_application_1/screens/weather_forecast_screen.dart';

// Главная функция (точка входа в приложение)
// Запускает приложение, вызывая виджет MyApp
void main() => runApp(MyApp());

// Объявляем класс MyApp, который наследуется от StatelessWidget
// StatelessWidget — виджет без внутреннего состояния (не меняется после создания)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Переопределяем метод build, который отвечает за построение интерфейса
  // BuildContext — это контекст, в котором находится виджет
  @override
  Widget build(BuildContext context) {
    // Возвращаем MaterialApp — корневой виджет Material Design
    // Он оборачивает всё приложение и предоставляет темы, маршрутизацию и т.д.
    return MaterialApp(
      // Свойство home — указывает главный экран приложения
      // В качестве главного экрана используем WeatherForecastScreen()
      home: LocationScreen(),
    );
  }
}

//стартовать с урока 11.7 с середины урока 31.07
