import 'package:flutter/material.dart';
import '../init/screen/screen_config.dart';

PreferredSize getAppBar(
    {required BuildContext context, required String title}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(Sc.height! * 8),
    child: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        brightness: Brightness.light,
        flexibleSpace: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: Sc.width! * 1.5),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/logo/logo.png'),
                width: Sc.width! * 10,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: Sc.width! * 5),
              Padding(
                padding: EdgeInsets.only(top: Sc.height! * .5),
                child:
                    Text(title, style: Theme.of(context).textTheme.headline1),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false),
  );
}
