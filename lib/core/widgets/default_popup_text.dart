import 'package:flutter/material.dart';

class DefaultPopupText extends StatelessWidget {
  final String text;
  const DefaultPopupText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4,
      textAlign: TextAlign.center,
    );
  }
}
