import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'localization.dart';

class MyLocalizationsDelegates extends LocalizationsDelegate<Localization> {
  const MyLocalizationsDelegates();

  static MyLocalizationsDelegates delegate = const MyLocalizationsDelegates();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate old) => false;

  @override
  Future<Localization> load(Locale locale) async {
    var localization = Localization(locale);
    await localization.load();
    return localization;
  }
}
