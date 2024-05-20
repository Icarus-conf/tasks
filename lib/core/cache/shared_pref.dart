import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String? getData(String key) {
    return prefs.getString(key);
  }

  Future<bool> deleteData(String key) async {
    return prefs.remove(key);
  }

  static Future<bool> saveData(String key, dynamic value) async {
    if (value is String) {
      return prefs.setString(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else {
      return false;
    }
  }

  static Future<bool> saveTodos(List<String> todos) {
    return prefs.setStringList('todos', todos);
  }
}
