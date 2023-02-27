import 'package:flutter/material.dart';

ThemeData customTheme(ThemeMode mode) {
  T useColorModeValue<T>(T light, T dark) =>
      mode == ThemeMode.light ? light : dark;

  MaterialColor primaryColor = Colors.red;

  ThemeData themeData = useColorModeValue(ThemeData.light(), ThemeData.dark());

  Color backgroundColor = themeData.scaffoldBackgroundColor;
  Color foregroundColor = useColorModeValue(Colors.black, Colors.white);

  return themeData.copyWith(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: primaryColor),
    backgroundColor: backgroundColor,
    primaryColor: primaryColor,

    // タップエフェクトを無効にする
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      titleTextStyle: TextStyle(
        color: foregroundColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
      ),
    ),

    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(primaryColor),
      trackColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(MaterialState.selected)
            ? primaryColor.shade200
            : null,
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (states) =>
            states.contains(MaterialState.selected) ? primaryColor : null,
      ),
    ),

    toggleButtonsTheme: ToggleButtonsThemeData(
      color: foregroundColor,
    ),

    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      border: InputBorder.none,
    ),
  );
}
