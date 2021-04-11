import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/navigation.dart';

import '../../../../core/dummy/authority_pin.dart';
import '../../../../core/init/helper/get_text.dart';
import '../../../../core/widgets/alert_dialog/custom_dialog.dart';
import '../../../../core/widgets/default_popup_text.dart';

BuildContext? localContext;

void confirmPin(List<String> currentPins, BuildContext context) {
  var userPin = currentPins.join('');
  var realPin = getAuthorityPin();
  localContext = context;
  if (realPin != userPin) {
    showDialog(context, 'wrong_pin');
  } else {
    showDialog(context, 'correct_pin');
  }
}

void showDialog(context, String textKey) {
  CustomDialog(
    action: textKey == 'correct_pin' ? navigate : () {},
    content: DefaultPopupText(text: getText(context, textKey)),
    rightButtonText: getText(context, 'ok'),
  ).show(context);
}

void navigate() {
  Navigator.of(localContext!).pushNamed(unauthorizedHomeRoute);
}
