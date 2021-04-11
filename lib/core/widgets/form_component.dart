import 'package:flutter/material.dart';

import '../init/helper/get_text.dart';
import '../init/screen/screen_config.dart';

class FormComponent extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final String initialText;
  final Function editText;
  const FormComponent(
      {required this.formKey,
      required this.initialText,
      required this.editText});

  @override
  _FormComponentState createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        style: TextStyle(fontSize: Sc.text! * 1.6),
        decoration: InputDecoration(
          counterStyle: TextStyle(fontSize: Sc.text! * 1.55),
        ),
        initialValue: widget.initialText,
        maxLength: 30,
        onChanged: (val) {
          widget.editText(val);
        },
        validator: validationFunction,
      ),
    );
  }

  String? validationFunction(val) {
    if (val == null || val.isEmpty) {
      return getText(context, 'cant_empty');
    }
    if (widget.initialText.contains('@')) {
      if (!val.contains('@')) {
        return getText(context, 'invalid_email');
      }
    }
  }
}
