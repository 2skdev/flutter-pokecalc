import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting.freezed.dart';
part 'setting.g.dart';

@freezed
abstract class Setting with _$Setting {
  const Setting._();

  const factory Setting({
    @Default(ThemeMode.light) ThemeMode theme,
    @Default(false) bool subscription,
  }) = _Setting;

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);
}
