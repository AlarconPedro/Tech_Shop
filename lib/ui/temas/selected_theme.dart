import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const Theme_Mode = "MODE";
  static const Dark = "DARK";
  static const Light = "LIGHT";

  setModeTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Theme_Mode, theme);
  }

  Future<String> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Theme_Mode) ?? Light;
  }
}
