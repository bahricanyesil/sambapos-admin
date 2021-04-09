import 'package:flutter/material.dart';
import '../init/screen/screen_config.dart';

class RoundedButton extends StatelessWidget {
  final onPressed;
  final String text;
  const RoundedButton({required this.onPressed, this.text = ''});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constrains) {
      return Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(Sc.width! * 4),
        shadowColor: Theme.of(context).primaryColor,
        color: Theme.of(context).primaryColor,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.symmetric(horizontal: Sc.width!, vertical: Sc.height!),
          onPressed: onPressed,
          animationDuration: Duration(milliseconds: 200),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sc.width! * 4),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: Sc.text! * 1.7,
                color: Colors.white.withOpacity(.9),
                fontWeight: FontWeight.w600),
          ),
        ),
      );
    });
  }
}
