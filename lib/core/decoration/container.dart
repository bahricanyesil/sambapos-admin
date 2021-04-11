import 'package:flutter/material.dart';
import '../init/screen/screen_config.dart';

class ContainerDeco {
  BoxDecoration infoItem(context) {
    return BoxDecoration(
        color: Theme.of(context).canvasColor.withOpacity(.9),
        border:
            Border.all(color: Theme.of(context).primaryColor.withOpacity(.3)),
        borderRadius: BorderRadius.all(Radius.circular(Sc.image! * .8)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 3),
          ),
        ]);
  }
}
