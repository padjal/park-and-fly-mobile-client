// theme_provider.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifier());

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;
  bool isDarkThemeEnabled = false;

  void toggleDark() {
    _themeData = ThemeData.dark();
    isDarkThemeEnabled = true;
    notifyListeners();
  }

  void toggleLight() {
    _themeData = ThemeData.light();
    isDarkThemeEnabled = false;
    notifyListeners();
  }
}