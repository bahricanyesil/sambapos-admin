import 'package:flutter/material.dart';
import '../../../../core/init/screen/screen_config.dart';

class NumberItem extends StatelessWidget {
  final Function() onPressedFunc;
  final String text;
  const NumberItem({required this.onPressedFunc, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sc.height! * 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor.withOpacity(.3)),
      alignment: Alignment.center,
      child: button(context),
    );
  }

  Widget button(context) {
    return MaterialButton(
      padding: EdgeInsets.all(Sc.width! * .5),
      onPressed: onPressedFunc,
      splashColor: Theme.of(context).canvasColor,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      height: Sc.height! * 12,
      child: text == 'delete'
          ? Icon(Icons.arrow_back_outlined,
              color: Colors.black87.withOpacity(.6), size: Sc.image! * 2)
          : Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87.withOpacity(.6),
                  fontSize: Sc.text! * 1.8),
            ),
    );
  }
}
