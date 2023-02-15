import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/setting_model.dart';
import '../models/theory_model.dart';

class Preference {
  static const String kSettingsKey = 'SETTINGS';
  static const String kTheoriesKey = 'THEORIES';
  static const String kEnemiesKey = 'ENEMIES';

  static Future<Setting?> getSettings() async {
    final pref = await SharedPreferences.getInstance();
    final ret = pref.getString(kSettingsKey);

    if (ret != null) {
      return Setting.fromJson(json.decode(ret));
    } else {
      return null;
    }
  }

  static Future<bool> saveSettings(Setting setting) async {
    final pref = await SharedPreferences.getInstance();

    return pref.setString(kSettingsKey, json.encode(setting.toJson()));
  }

  static Future<List<Theory>?> getTheories(String key) async {
    final pref = await SharedPreferences.getInstance();
    final ret = pref.getStringList(key);

    if (ret != null) {
      return ret.map((e) => Theory.fromJson(json.decode(e))).toList();
    } else {
      return null;
    }
  }

  static Future<bool> saveTheories(String key, List<Theory> theories) async {
    final pref = await SharedPreferences.getInstance();

    return pref.setStringList(
      key,
      theories.map((e) {
        return json.encode(e.toJson());
      }).toList(),
    );
  }
}
