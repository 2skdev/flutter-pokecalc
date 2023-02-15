import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../misc/preferences.dart';
import '../models/setting_model.dart';

class SettingProvider extends StateNotifier<Setting> {
  SettingProvider() : super(const Setting());

  Future init() async {
    Preference.getSettings().then((settings) {
      if (settings != null) {
        state = settings;
      }

      addListener((state) {
        Preference.saveSettings(state);
      });
    });
  }

  void setState(Setting setting) {
    state = setting;
  }

  void toggleTheme() {
    state = state.copyWith(
      theme: state.theme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
    );
  }
}

final settingProvider = StateNotifierProvider<SettingProvider, Setting>(
  (_) => SettingProvider(),
);
