import 'package:flutter/material.dart';
import '../decoration/text_form.dart';
import '../init/helper/get_text.dart';

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
        decoration: TextFormDeco().loginDeco(context).copyWith(
              hintText: widget.hintText,
              prefixIcon: widget.icon == null
                  ? Container()
                  : Icon(
                      widget.icon,
                      color: Theme.of(context).primaryColor,
                    ),
              suffixIcon: isPassword()
                  ? IconButton(
                      color: Theme.of(context).canvasColor,
                      splashRadius: 1,
                      icon: Icon(
                          showPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Theme.of(context).primaryColor),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    )
                  : null,
            ),
        onChanged: (val) {
          widget.save(val, isPassword());
        },
        obscureText: isPassword() && !showPassword ? true : false,
        validator: (val) {
          if (val == null || val.isEmpty) {
            return getText(context, 'cant_empty');
          } else if (widget.type == 'password' && val.length < 6) {
            return getText(context, 'short_pwd');
          } else if (widget.type == 'email' && !val.contains('@')) {
            return getText(context, 'invalid_email');
          }
        });
  }

  bool isPassword() {
    return widget.type == 'password';
  }
}
