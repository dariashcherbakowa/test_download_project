//1. ниже я создала модель для работы с прогнозом погоды.
// наша модель будет содержать все поля, которые есть в json
// раннее - json мы получили с сайта https://openweathermap.org/api/forecast16?collection=current_forecast#builtin во вкладке api по
//апи по местоположению - api.openweathermap.org/data/2.5/forecast/daily?q={city name}&cnt={cnt}&appid={API key}
//где ввели свои данные в строке - именно (город/ключ апи с курса 1369dd6b5ae78fc9952261ab9aa236b4 )
// а также перевели фаренгейты в цельсии благодаря последним данным строчки
// https://api.openweathermap.org/data/2.5/forecast/daily?q=London&appid=1369dd6b5ae78fc9952261ab9aa236b4&units=metric
//получив данные по ссылке в формате json - эти данные мы форматировали в читаемый код
//cо значениями json (погоды по дням/города/влажности и др свойствам)
// https://www.bejson.com/ru/jsoneditoronline/
//а далее эти данные конвертировали с json в дарт https://javiercbk.github.io/json_to_dart/
// тем самым получив код ниже.
// далее скорректировали тип List на WeatherList точечно по строчкам   List<WeatherList>? list;
// list!.add(new WeatherList.fromJson(v)); - итд. можно найти по поиску по коду
//чтобы встроенный типс список List  не конфликтовал с моим типом List(WeatherList)
// Конфликт возникает потому, что у встроенного List и твоего класса List разная «роль»:
//один — контейнер для данных, другой — сами данные; при попытке
//использовать List<Weather> Dart выбирает встроенный, но твой класс мешает, создавая неоднозначность.
//а также заменили тип  с double на int? pop;- тк эта величина измеряется в целых значениях

//т.е здесь не прописаны данные, здесь
//ниже прописана модель, которая работает как инструкция, как распаковывать
//данные о погоде, когда она придет с сервера (придет она во время запуска на эмуляторе)

import 'package:flutter_application_1/utilities/constans.dart';

class WeatherForecast {
  City? city;
  String? cod;
  num? message; // ← исправлено: double? → num?
  int? cnt;
  List<WeatherList>? list;

  WeatherForecast({this.city, this.cod, this.message, this.cnt, this.list});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <WeatherList>[];
      json['list'].forEach((v) {
        list!.add(WeatherList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
  });

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    return data;
  }
}

class Coord {
  num? lon; // ← исправлено: double? → num?
  num? lat; // ← исправлено: double? → num?

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lon'] = lon;
    data['lat'] = lat;
    return data;
  }
}

class WeatherList {
  int? dt;
  int? sunrise;
  int? sunset;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  List<Weather>? weather;
  num? speed;
  int? deg;
  num? gust;
  int? clouds;
  int? pop;

  WeatherList({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.weather,
    this.speed,
    this.deg,
    this.gust,
    this.clouds,
    this.pop,
  });

  WeatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'] != null ? Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
    clouds = json['clouds'];
    pop = (json['pop'] as num?)?.toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    if (temp != null) {
      data['temp'] = temp!.toJson();
    }
    if (feelsLike != null) {
      data['feels_like'] = feelsLike!.toJson();
    }
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    data['speed'] = speed;
    data['deg'] = deg;
    data['gust'] = gust;
    data['clouds'] = clouds;
    data['pop'] = pop;
    return data;
  }

  // Исправленный метод getIconUrl
  String getIconUrl() {
    if (weather == null || weather!.isEmpty) return '';
    return '${Constants.WEATHER_IMAGES_URL}${weather![0].icon!}.png';
  }
}

// ✅ Исправлено: double? → num?, убраны .toDouble()
class Temp {
  num? day;
  num? min;
  num? max;
  num? night;
  num? eve;
  num? morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['min'] = min;
    data['max'] = max;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}

// ✅ Исправлено: double? → num?, убраны .toDouble()
class FeelsLike {
  num? day;
  num? night;
  num? eve;
  num? morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}
