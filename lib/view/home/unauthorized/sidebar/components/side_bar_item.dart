import 'package:flutter/material.dart';
import '../../../../../core/init/screen/screen_config.dart';

class SideBarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onPressed;
  const SideBarItem(
      {required this.icon, required this.title, required this.onPressed});

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
            Icon(icon, color: Colors.white.withOpacity(.8)),
            SizedBox(width: Sc.width!),
            Text(title,
                style: Theme.of(context).textTheme.headline3,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
