import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier with WidgetsBindingObserver {
  bool isDarkTheme = false;

  ThemeManager() {
    WidgetsBinding.instance.addObserver(this);
  }

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  ThemeMode currentTheme() {
    return isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    isDarkTheme = brightness == Brightness.dark;
    notifyListeners();
  }

  void setThemeMode(bool value) {
    isDarkTheme = value;
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
