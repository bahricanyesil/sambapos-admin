import 'package:flutter/material.dart';

import '../decoration/text_form.dart';
import '../init/helper/get_text.dart';
import '../init/screen/screen_config.dart';

class RoundedTextForm extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final String type;
  final save;

  const RoundedTextForm(
      {this.hintText = '', this.icon, required this.type, this.save});

  @override
  _RoundedTextFormState createState() => _RoundedTextFormState();
}

class _RoundedTextFormState extends State<RoundedTextForm> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    // Couldn't add a padding since the parameter does not work on WEB correctly. I will open an issue in the package repo.
    return TextFormField(
        expands: false,
        style: TextStyle(fontSize: Sc.height! * .6 + Sc.width! * .8),
        decoration: TextFormDeco().loginDeco(context).copyWith(
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: Sc.height! * .6 + Sc.width! * .8),
              prefixIcon: prefixIcon(context),
              suffixIcon: suffixIcon(context),
            ),
        onChanged: (val) {
          widget.save(val, isPassword());
        },
        obscureText: isPassword() && !showPassword ? true : false,
        validator: validationFunction);
  }

  Widget prefixIcon(context) {
    return widget.icon == null
        ? Container()
        : Icon(widget.icon,
            color: Theme.of(context).primaryColor, size: Sc.image! * 2.2);
  }

  Widget? suffixIcon(context) {
    return isPassword()
        ? IconButton(
            padding: EdgeInsets.only(right: Sc.width! * .8),
            color: Theme.of(context).canvasColor,
            splashRadius: 1,
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              color: Theme.of(context).primaryColor,
              size: Sc.image! * 2.5,
            ),
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
          )
        : null;
  }

  String? validationFunction(val) {
    if (val == null || val.isEmpty) {
      return getText(context, 'cant_empty');
    } else if (widget.type == 'password' && val.length < 6) {
      return getText(context, 'short_pwd');
    } else if (widget.type == 'email' && !val.contains('@')) {
      return getText(context, 'invalid_email');
    }
  }

  bool isPassword() {
    return widget.type == 'password';
  }
}
