import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences extends ChangeNotifier {
  String currentTheme = 'Otomatik';

  ThemeMode get themeMode {
    if (currentTheme == 'Aydınlık Tema') {
      return ThemeMode.light;
    } else if (currentTheme == 'Karanlık Tema') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  changeTheme(String theme) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    await _prefs.setString('theme', theme);

    currentTheme = theme;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    currentTheme = _prefs.getString('theme') ?? 'Otomatik';
    notifyListeners();
  }
}