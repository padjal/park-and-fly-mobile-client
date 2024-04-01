import 'dart:ui';
import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApplicationSettings extends ChangeNotifier {
  late SharedPreferences prefs;
  bool isDarkModeEnabled = false;
  Locale currentLocale = Locale("en");

  Future _init() async {
    prefs = await SharedPreferences.getInstance();

    isDarkModeEnabled = prefs.getBool("isDarkModeEnabled") ?? false;
    final currentCountryCode = await prefs.getString('currentLocale') ?? "en";
    currentLocale = Locale(currentCountryCode);

    notifyListeners();
  }

  ApplicationSettings() : super() {
    _init();
  }

  changeLocale(String newLocale) async {
    currentLocale = Locale(newLocale);
    notifyListeners();
    await prefs.setString('currentLocale', newLocale);
  }

  changeTheme() async {
    isDarkModeEnabled = !isDarkModeEnabled;
    notifyListeners();
    await prefs.setBool('isDarkModeEnabled', isDarkModeEnabled);
  }
}

final applicationSettingsProvider = ChangeNotifierProvider<ApplicationSettings>((ref) => ApplicationSettings());