import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode mode = ThemeMode.dark;

  changeTheme(ThemeMode themeMode) {
    mode = themeMode;

    notifyListeners();
  }
}
