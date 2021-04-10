import 'package:flutter/material.dart';
import '../../../../core/init/screen/screen_config.dart';

import './number_item.dart';

class NumberPad extends StatelessWidget {
  final Function setPin;
  const NumberPad({required this.setPin});

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
                  return lastRow();
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

  Widget lastRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        customizedItem('-1'),
        customizedItem('0'),
        customizedItem('11')
      ],
    );
  }

  Widget customizedItem(String text) {
    return Container( 
      height: Sc.height! * 10,
      width: Sc.width! * 6,
      margin: EdgeInsets.symmetric(vertical: Sc.height!, horizontal: Sc.width!),
      child: NumberItem(onPressedFunc: () => setPin(text), text: text),
    );
  }
}
