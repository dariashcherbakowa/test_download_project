import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _cityKey = 'last_city';
  static const String _favoritesKey = 'favorite_cities';

  // Сохранить последний город
  static Future<void> saveCity(String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cityKey, city);
  }

  // Загрузить последний город
  static Future<String?> getCity() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_cityKey);
  }

  // ⬇️ НОВЫЕ МЕТОДЫ ДЛЯ ИЗБРАННЫХ ⬇️

  // Сохранить список избранных городов
  static Future<void> saveFavorites(List<String> cities) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favoritesKey, cities);
  }

  // Загрузить список избранных городов
  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  // Добавить город в избранное
  static Future<void> addFavorite(String city) async {
    final favorites = await getFavorites();
    if (!favorites.contains(city)) {
      favorites.add(city);
      await saveFavorites(favorites);
    }
  }

  // Удалить город из избранного
  static Future<void> removeFavorite(String city) async {
    final favorites = await getFavorites();
    favorites.remove(city);
    await saveFavorites(favorites);
  }

  // Проверить, есть ли город в избранном
  static Future<bool> isFavorite(String city) async {
    final favorites = await getFavorites();
    return favorites.contains(city);
  }
}
