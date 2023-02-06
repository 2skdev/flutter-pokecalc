import 'package:flutter/material.dart';

ThemeData customTheme(ThemeMode mode) {
  T useColorModeValue<T>(T light, T dark) =>
      mode == ThemeMode.light ? light : dark;

  ThemeData themeData = useColorModeValue(ThemeData.light(), ThemeData.dark());

  themeData = themeData.copyWith(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red));

  Color backgroundColor =
      useColorModeValue(Colors.grey.shade50, Colors.grey.shade900);
  Color foregroundColor = useColorModeValue(Colors.black, Colors.white);

  return themeData.copyWith(
    backgroundColor: backgroundColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
      ),
    ),
    chipTheme: const ChipThemeData(
      labelStyle: TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      color: foregroundColor,
    ),
  );
}
