import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedNotifier extends ChangeNotifier {
  static late SharedPreferences _sharedPrefs;

  SharedNotifier({Key? key});

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  bool? getBool(String key) {
    return _sharedPrefs.getBool(key);
  }

  int? getInt(String key) {
    return _sharedPrefs.getInt(key);
  }

  double? getDouble(String key) {
    return _sharedPrefs.getDouble(key);
  }

  String? getString(String key) {
    return _sharedPrefs.getString(key);
  }

  List<String>? getStringList(String key) {
    return _sharedPrefs.getStringList(key);
  }

  Future<bool?> setBool(String key, bool value) {
    var ret = _sharedPrefs.setBool(key, value);
    notifyListeners();
    return ret;
  }

  Future<bool?> setInt(String key, int value) {
    var ret = _sharedPrefs.setInt(key, value);
    notifyListeners();
    return ret;
  }

  Future<bool?> setDouble(String key, double value) {
    var ret = _sharedPrefs.setDouble(key, value);
    notifyListeners();
    return ret;
  }

  Future<bool?> setString(String key, String value) {
    var ret = _sharedPrefs.setString(key, value);
    notifyListeners();
    return ret;
  }

  Future<bool?> setStringList(String key, List<String> value) {
    var ret = _sharedPrefs.setStringList(key, value);
    notifyListeners();
    return ret;
  }

  void set(String key, dynamic value) {
    debugPrint("Saving $key as $value");
    switch (value.runtimeType) {
      case bool:
        setBool(key, value);
        break;
      case int:
        setInt(key, value);
        break;
      case double:
        setDouble(key, value);
        break;
      case String:
        setString(key, value);
        break;
      case List<String>:
        setStringList(key, value);
        break;
      default:
        // Just in case, tell everyone to update.
        notifyListeners();
    }
  }
}
