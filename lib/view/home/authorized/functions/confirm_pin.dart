import 'package:flutter/cupertino.dart';
import '../../../../core/constants/navigation.dart';
import '../../../../core/dummy/authority_pin.dart';
import '../../../../core/init/helper/get_text.dart';
import '../../../../core/widgets/error/custom_dialog.dart';

void confirmPin(List<String> currentPins, BuildContext context) {
  var userPin = currentPins.join('');
  var realPin = getAuthorityPin();
  if (realPin != userPin) {
    CustomDialog(
      content: getText(context, 'wrong_pin'),
      rightButtonText: getText(context, 'ok'),
    ).show(context);
  } else {
    Navigator.of(context).pushNamed(unauthorizedHomeRoute);
  }
}
