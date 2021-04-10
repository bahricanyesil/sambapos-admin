import 'package:flutter/material.dart';
import '../init/screen/screen_config.dart';

class TextFormDeco {
  InputDecoration loginDeco(context) {
    return InputDecoration(
        errorMaxLines: 1,
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

  InputDecoration pinFormDeco(context) {
    return InputDecoration(
      counter: Offstage(),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
    );
  }

  BoxDecoration pinDeco(context) {
    return BoxDecoration(
        border: Border.all(color: Colors.black26, width: Sc.width! * .05),
        borderRadius: BorderRadius.all(
          Radius.circular(Sc.width! * 1.8),
        ),
        color: Theme.of(context).primaryColor.withOpacity(.6));
  }
}
