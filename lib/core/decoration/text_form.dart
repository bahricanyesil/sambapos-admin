import 'package:flutter/material.dart';
import '../init/screen/screen_config.dart';

class TextFormDeco {
  InputDecoration loginDeco(context) {
    return InputDecoration(
        errorMaxLines: 1,
        // contentPadding: EdgeInsets.only(left: Sc.width!),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: Sc.width! * .05),
          borderRadius: BorderRadius.all(
            Radius.circular(Sc.width! * 1.8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor, width: Sc.width! * .07),
          borderRadius: BorderRadius.all(
            Radius.circular(Sc.width! * 1.8),
          ),
        ));
  }
}
