import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/dummy/authority_pin.dart';
import '../../../../core/init/helper/get_text.dart';
import '../../../../core/widgets/default_popup_text.dart';
import '../../../../core/widgets/error/custom_dialog.dart';

void confirmPin(List<String> currentPins, BuildContext context) {
  var userPin = currentPins.join('');
  var realPin = getAuthorityPin();
  if (realPin != userPin) {
    CustomDialog(
      content: DefaultPopupText(text: getText(context, 'wrong_pin')),
      rightButtonText: getText(context, 'ok'),
    ).show(context);
  } else {
    CustomDialog(
      content: DefaultPopupText(text: getText(context, 'correct_pin')),
      rightButtonText: getText(context, 'ok'),
    ).show(context);
  }
}
