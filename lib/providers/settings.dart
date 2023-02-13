import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/setting.dart';
import 'preferences.dart';

class SettingsNotifier extends StateNotifier<Setting> {
  SettingsNotifier() : super(const Setting()) {
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

final settingsNofifier = StateNotifierProvider<SettingsNotifier, Setting>(
  (_) => SettingsNotifier(),
);
