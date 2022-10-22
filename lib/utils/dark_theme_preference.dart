import 'package:shared_preferences/shared_preferences.dart';

class DarkThemePreference {
  static const themeStatus = 'themeStatus';

  setDarkTheme(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(themeStatus, value);
  }

  Future<String> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(themeStatus) ?? 'system';
  }
}
