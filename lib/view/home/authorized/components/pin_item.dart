import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/decoration/text_form.dart';
import '../../../../core/init/screen/screen_config.dart';

class PinItem extends StatelessWidget {
  final TextEditingController controller;
  final Function changeIndex;
  final int index;
  final FocusNode focusNode;
  final Function setPin;
  const PinItem(
      {required this.controller,
      required this.changeIndex,
      required this.index,
      required this.focusNode,
      required this.setPin});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Sc.width! * 5.2,
        height: Sc.width! * 5.2,
        decoration: TextFormDeco().pinDeco(context),
        alignment: Alignment.center,
        child: TextFormField(
            autofocus: true,
            focusNode: focusNode,
            controller: controller,
            obscureText: false,
            cursorColor: Colors.white,
            maxLength: 1,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ],
            onTap: () => changeIndex(index),
            // ignore: unnecessary_lambdas
            onChanged: (val) => setPin(val, index),
            decoration: TextFormDeco().pinFormDeco(context),
            style: TextStyle(
                color: Colors.white.withOpacity(.9),
                fontWeight: FontWeight.bold,
                fontSize: Sc.text! * 2.8),
            textAlign: TextAlign.center));
  }
}
