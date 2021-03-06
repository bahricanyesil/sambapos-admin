import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../init/screen/screen_config.dart';

import 'sensitive_platform_widget.dart';

class CustomDialog extends SensitivePlatformWidget {
  final Widget content;
  final String rightButtonText;
  final Function action;
  static void defaultFunc() {}

  CustomDialog(
      {required this.content,
      required this.rightButtonText,
      this.action = defaultFunc});

  Future<void> show(BuildContext context) async {
    if (kIsWeb) {
      await showDialog(context: context, builder: (context) => this);
    } else {
      await showModal(
        configuration: FadeScaleTransitionConfiguration(
          transitionDuration: Duration(milliseconds: 500),
        ),
        context: context,
        builder: (context) => this,
      );
    }
  }

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return AlertDialog(
      content: content,
      actions: _setDialogButton(context),
    );
  }

  @override
  Widget buildIOSWidget(BuildContext context) {
    return CupertinoAlertDialog(
      content: content,
      actions: _setDialogButton(context),
    );
  }

  @override
  Widget buildMainWidget(BuildContext context) {
    return AlertDialog(
      title: content,
      actions: _setDialogButton(context),
    );
  }

  List<Widget> _setDialogButton(BuildContext context) {
    final allButtons = <Widget>[];

    if (kIsWeb) {
      addButton(allButtons, context);
    } else if (Platform.isIOS) {
      allButtons.add(
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            action();
          },
          child: Text(
            rightButtonText,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      );
    } else {
      addButton(allButtons, context);
    }

    return allButtons;
  }

  void addButton(allButtons, context) {
    allButtons.add(
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
          action();
        },
        child: Padding(
          padding: EdgeInsets.only(right: Sc.width!, bottom: Sc.height!),
          child: Text(
            rightButtonText,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
