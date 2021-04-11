import 'package:flutter/material.dart';
import '../../../../core/init/helper/get_text.dart';
import '../../../../core/init/screen/screen_config.dart';

import './number_item.dart';

class NumberPad extends StatelessWidget {
  final Function setPin;
  final Function deletePin;
  final Function confirmPin;
  const NumberPad(
      {required this.setPin,
      required this.deletePin,
      required this.confirmPin});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Sc.height! * 60,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index == 3) {
                  return lastRow(context);
                } else {
                  return numberPadRow(index);
                }
              }),
        ),
      ],
    );
  }

  Widget numberPadRow(int higherIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3,
          (index) => customizedItem((index + 1 + higherIndex * 3).toString())),
    );
  }

  Widget lastRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customizedItem('delete'),
        customizedItem('0'),
        customizedItem(getText(context, 'short_ok'), context)
      ],
    );
  }

  Widget customizedItem(String text, [BuildContext? context]) {
    var onPressedFunc = () {
      if (text == 'delete') {
        deletePin();
      } else if (context != null && text == getText(context, 'short_ok')) {
        confirmPin();
      } else {
        setPin(text);
      }
    };
    return Container(
      height: Sc.height! * 10,
      width: Sc.width! * 6,
      margin: EdgeInsets.symmetric(vertical: Sc.height!, horizontal: Sc.width!),
      child: NumberItem(onPressedFunc: onPressedFunc, text: text),
    );
  }
}
