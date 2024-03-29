import 'dart:ui';

import 'package:flutter/src/foundation/change_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AppLocalization extends ChangeNotifier {
  Locale currentLocale = Locale('en');

  changeLocale(String newLocale){
    currentLocale = Locale(newLocale);
    notifyListeners();
  }
}

final localeProvider = ChangeNotifierProvider<AppLocalization>((ref) {
  return AppLocalization();
});