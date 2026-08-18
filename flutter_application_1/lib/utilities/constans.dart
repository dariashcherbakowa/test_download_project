//2.1 создаем необходимые константы - настройками для работы с апи
// Он хранит все неизменяемые данные, которые нужны для запросов к серверу.
//этот файл будет содержать константы типо app id, базовый url к нашему запросу
//- и так далее

class Constants {
  // ← исправлено: Constans → Constants
  static const String WEATHER_APP_ID =
      '1369dd6b5ae78fc9952261ab9aa236b4'; //Ключ доступа к API (как пароль). Без него сервер не ответит
  static const String WEATHER_BASE_SCHEME =
      'https://'; //Протокол (безопасное соединение)
  static const String WEATHER_URL_DOMAIN =
      'api.openweathermap.org'; //Адрес сервера (к кому обращаемся)
  static const String WEATHER_FORECAST_PATH =
      '/data/2.5/forecast/daily'; //Путь к нужному эндпоинту (прогноз)
  static const String WEATHER_IMAGES_PATH =
      '/img/w/'; //Путь к папке с иконками погоды
  //Картинки не твои — они принадлежат OpenWeatherMap
  // Их хранит сервис и отдаёт по запросу
  // Ты просто подставляешь название иконки в их URL
  static const String WEATHER_IMAGES_URL =
      WEATHER_BASE_SCHEME +
      WEATHER_URL_DOMAIN +
      WEATHER_IMAGES_PATH; //Полный URL для загрузки иконок
}
