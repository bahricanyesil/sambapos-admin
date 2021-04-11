import 'package:flutter/material.dart';
import '../init/helper/get_text.dart';
import '../init/screen/screen_config.dart';

class DefaultButtonRow extends StatelessWidget {
  final Function onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spaceConst;
  final String? routeName;
  final GlobalKey<FormState>? formKey;
  const DefaultButtonRow(
      {required this.onPressed,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.spaceConst = 1.5,
      this.routeName,
      this.formKey});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        cancelButton(context),
        SizedBox(width: Sc.width! * spaceConst),
        okButton(context)
      ],
    );
  }

  Widget cancelButton(context) {
    return TextButton(
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
            color: Theme.of(context).errorColor, fontSize: Sc.text! * 1.7),
      ),
    );
  }

  Widget okButton(context) {
    return TextButton(
      onPressed: () {
        if (formKey != null && !formKey!.currentState!.validate()) {
          return;
        }
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
            color: Theme.of(context).primaryColor, fontSize: Sc.text! * 1.8),
      ),
    );
  }
}
