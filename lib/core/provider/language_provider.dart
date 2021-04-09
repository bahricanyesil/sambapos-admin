import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale appLocale = Locale('tr');

  Future<Type> fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('language_code') == null) {
      return Null;
    }
    appLocale = Locale(prefs.getString('language_code') ?? 'tr');
    return Null;
  }

  Future<void> changeLanguage(type) async {
    var prefs = await SharedPreferences.getInstance();
    if (appLocale == type) {
      return;
    }
    if (type == 'tr') {
      appLocale = Locale('tr');
      await prefs.setString('language_code', 'tr');
    } else {
      appLocale = Locale('en');
      await prefs.setString('language_code', 'en');
    }

    notifyListeners();
  }
}
