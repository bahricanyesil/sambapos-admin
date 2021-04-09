import 'package:flutter/material.dart';
import '../../localization/localization.dart';

String getText(BuildContext context, textName) {
  return Localization.of(context)?.getText(textName) ?? '';
}
