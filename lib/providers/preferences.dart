import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/theory.dart';

class Preference {
  static const String kTheoriesKey = 'THEORIES';
  static const String kEnemiesKey = 'ENEMIES';

  static Future<List<Theory>?> get(String key) async {
    final pref = await SharedPreferences.getInstance();

    final ret = pref.getStringList(key);

    if (ret != null) {
      return ret.map((e) => Theory.fromJson(json.decode(e))).toList();
    } else {
      return null;
    }
  }

  static Future<bool> save(String key, List<Theory> theories) async {
    final pref = await SharedPreferences.getInstance();

    return pref.setStringList(
      key,
      theories.map((e) {
        return json.encode(e.toJson());
      }).toList(),
    );
  }
}
