import 'package:flutter/material.dart';
import '../init/helper/get_text.dart';
import '../init/screen/screen_config.dart';

class DefaultButtonRow extends StatelessWidget {
  final Function onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spaceConst;
  final String? routeName;
  const DefaultButtonRow(
      {required this.onPressed,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.spaceConst = 1.5,
      this.routeName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        TextButton(
            onPressed: () {
              if (routeName != null) {
                Navigator.of(context).pushNamed(routeName ?? '');
              } else {
                Navigator.of(context).pop('dialog');
              }
            },
            child: Text(
              getText(context, 'cancel'),
              style: TextStyle(
                  color: Theme.of(context).errorColor,
                  fontSize: Sc.text! * 1.5),
            )),
        SizedBox(width: Sc.width! * spaceConst),
        TextButton(
          onPressed: () {
            onPressed();
            if (routeName != null) {
              Navigator.of(context).pushNamed(routeName ?? '');
            } else {
              Navigator.of(context).pop('dialog');
            }
          },
          child: Text(
            getText(context, 'ok'),
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: Sc.text! * 1.6),
          ),
        )
      ],
    );
  }
}
