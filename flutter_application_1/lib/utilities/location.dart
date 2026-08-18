//урок 11.10 получение погоды по геолокации

//введем пакет geolocation в пабспекямл из пабдев
//создадим вспомогательный класс для нашей геолокации, который будет получать ее используя
//наше устройство или эмулятор

import 'package:geolocator/geolocator.dart';

class Location {
  // для хранения долготы и широты создадим две переменные
  double? latitude; // широта (может быть null)
  double? longitude; // долгота (может быть null)

  Future<void> getCurrentLocation() async {
    try {
      // Проверяем, включена ли геолокация
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'Location services are disabled.';
      }

      // Проверяем разрешения
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw 'Location permissions are denied.';
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw 'Location permissions are permanently denied.';
      }

      // Получаем текущую позицию с таймаутом
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      ).timeout(const Duration(seconds: 5)); // ← исправлено

      // Сохраняем координаты
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      throw 'Something goes wrong: $e';
    }
  }
}
