import 'package:flutter/material.dart';

class AppLanguage extends ChangeNotifier {
  Locale appLocale = Locale('tr');

  void fetchLocale() {
    Locale('tr');
  }

  Future<void> changeLanguage(type) async {
    if (appLocale == type) {
      return;
    }
    if (type == 'tr') {
      appLocale = Locale('tr');
    } else {
      appLocale = Locale('en');
    }

    notifyListeners();
  }
}
