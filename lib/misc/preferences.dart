import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/party_model.dart';
import '../models/setting_model.dart';
import '../models/theory_model.dart';

enum PreferenceKeys {
  setting,
  parties,
  theories,
  enemies,
}

class Preference {
  static Future<Setting?> getSettings() async {
    final pref = await SharedPreferences.getInstance();
    final ret = pref.getString(PreferenceKeys.setting.name);

    if (ret != null) {
      return Setting.fromJson(json.decode(ret));
    } else {
      return null;
    }
  }

  static Future<bool> saveSettings(Setting setting) async {
    final pref = await SharedPreferences.getInstance();

    return pref.setString(
      PreferenceKeys.setting.name,
      json.encode(setting.toJson()),
    );
  }

  static Future<List<Party>?> getParties() async {
    final pref = await SharedPreferences.getInstance();
    final ret = pref.getStringList(PreferenceKeys.parties.name);

    if (ret != null) {
      return ret.map((e) => Party.fromJson(json.decode(e))).toList();
    } else {
      return null;
    }
  }

  static Future<bool> saveParties(List<Party> parties) async {
    final pref = await SharedPreferences.getInstance();

    return pref.setStringList(
      PreferenceKeys.parties.name,
      parties.map((e) {
        return json.encode(e.toJson());
      }).toList(),
    );
  }

  static Future<List<Theory>?> getTheories(PreferenceKeys key) async {
    final pref = await SharedPreferences.getInstance();
    final ret = pref.getStringList(key.name);

    if (ret != null) {
      return ret.map((e) => Theory.fromJson(json.decode(e))).toList();
    } else {
      return null;
    }
  }

  static Future<bool> saveTheories(
      PreferenceKeys key, List<Theory> theories) async {
    final pref = await SharedPreferences.getInstance();

    return pref.setStringList(
      key.name,
      theories.map((e) {
        return json.encode(e.toJson());
      }).toList(),
    );
  }
}
