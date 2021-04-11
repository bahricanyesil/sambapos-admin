import 'package:flutter/material.dart';
import '../../../../../core/init/screen/screen_config.dart';

class SideBarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onPressed;
  final bool isBold;
  const SideBarItem(
      {required this.icon,
      required this.title,
      required this.onPressed,
      this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: Sc.height! * 8,
        padding: EdgeInsets.only(left: Sc.width!),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon,
                color: Colors.white.withOpacity(isBold ? 1 : 0.8),
                size: Sc.width! * 1.4 + Sc.height! * .7),
            SizedBox(width: Sc.width!),
            Text(title,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: Sc.width! * 1.1 + Sc.height! * .4,
                    color: Colors.white.withOpacity(isBold ? 1 : .9),
                    fontWeight: isBold ? FontWeight.bold : FontWeight.w400),
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
