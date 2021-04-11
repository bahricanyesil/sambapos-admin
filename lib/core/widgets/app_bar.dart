import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../init/helper/get_text.dart';
import '../init/screen/screen_config.dart';
import '../provider/language_provider.dart';

PreferredSize getAppBar(
    {required BuildContext context, required String title}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(Sc.height! * 8),
    child: AppBar(
      backgroundColor: Theme.of(context).canvasColor,
      brightness: Brightness.light,
      flexibleSpace: mainContainer(context, title),
      automaticallyImplyLeading: false,
    ),
  );
}

Widget mainContainer(context, title) {
  return Container(
    alignment: Alignment.bottomCenter,
    padding: EdgeInsets.only(left: Sc.width! * 1.5),
    child: Row(
      children: [
        Image(
          image: AssetImage('assets/logo/logo.png'),
          width: Sc.width! * 12,
          fit: BoxFit.fitWidth,
        ),
        SizedBox(width: Sc.width! * 8),
        screenText(context, title),
        changeLanguagePart(context)
      ],
    ),
  );
}

Widget screenText(context, title) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.only(top: Sc.height! * .5),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(fontSize: Sc.width! * 1.6 + Sc.height! * .8),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget changeLanguagePart(context) {
  return Container(
    width: Sc.width! * 20,
    alignment: Alignment.centerRight,
    padding: EdgeInsets.only(right: Sc.width! * 1.7),
    child: TextButton(
      onPressed: () => changeLang(context),
      child: Text(
        getText(context, 'change_lang'),
        style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Colors.black.withOpacity(.62),
            fontSize: Sc.width! * .8 + Sc.height! * .5),
      ),
    ),
  );
}

void changeLang(context) {
  var isTurkish = Localizations.localeOf(context).languageCode == 'tr';
  Provider.of<AppLanguage>(context, listen: false)
      .changeLanguage(isTurkish ? 'en' : 'tr');
}
