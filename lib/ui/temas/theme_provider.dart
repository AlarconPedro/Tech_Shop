import 'package:flutter/material.dart';
import 'package:tech_shop/ui/temas/selected_theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  String _theme = ThemePreference.Light;

  String get theme => _theme;

  set setTheme(String theme) {
    _theme = theme;
    themePreference.setModeTheme(theme);
    notifyListeners();
  }

  bool isDarkTheme() => _theme == ThemePreference.Dark;
}
