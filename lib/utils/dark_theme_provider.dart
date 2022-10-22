import 'package:calculator/utils/dark_theme_preference.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  ThemeMode _darkTheme = ThemeMode.system;
  ThemeMode get darkTheme => _darkTheme;

  set darkTheme(ThemeMode value) {
    _darkTheme = value;
    if (value == ThemeMode.dark) {
      darkThemePreference.setDarkTheme('dark');
    } else if (value == ThemeMode.light) {
      darkThemePreference.setDarkTheme('light');
    } else if (value == ThemeMode.system) {
      darkThemePreference.setDarkTheme('system');
    }
    notifyListeners();
  }
}
