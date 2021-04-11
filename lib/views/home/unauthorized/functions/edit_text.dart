import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/init/helper/get_text.dart';
import '../../../../core/widgets/error/custom_dialog.dart';

Future<String> editText(String initialText, BuildContext context) async {
  var text = initialText;
  await CustomDialog(
    content: TextFormField(
      initialValue: initialText,
      maxLength: 30,
      onChanged: (val) => text = val,
    ),
    rightButtonText: getText(context, 'ok'),
  ).show(context);
  return text;
}
