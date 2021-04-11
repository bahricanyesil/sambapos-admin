import 'package:flutter/material.dart';
import '../../init/screen/screen_config.dart';

import 'choose_dialog.dart';

void showChooseDialog(context, title, initialValue, setValue) {
  Widget infoChooseChild =
      InfoChooseDialog(title: title, value: initialValue, setValue: setValue);
  showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                padding: EdgeInsets.only(
                    left: Sc.width! * 3,
                    top: Sc.width! * 3,
                    right: Sc.width! * 3,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 20),
                child: infoChooseChild),
          ));
}
