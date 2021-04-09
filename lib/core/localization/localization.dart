import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization {
  final Locale locale;
  Localization(this.locale);
  late Map<String, String> _localizedStrings;

  static Localization? of(BuildContext context) {
    return Localizations.of(context, Localization);
  }

  String getText(key) {
    return _localizedStrings[key] ?? '';
  }

  Future<bool> load() async {
    var jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }
}
