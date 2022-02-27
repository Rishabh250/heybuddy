import 'package:flutter/material.dart';

import './dark_theme_preference.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreference darkThemePreference = DarkThemePreference();
  bool _liteTheme = true;

  bool get liteTheme => _liteTheme;

  set liteTheme(bool value) {
    _liteTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }

  void changeTheme(bool value) {
    _liteTheme = value;
    darkThemePreference.setDarkTheme(value);
    notifyListeners();
  }
}
 