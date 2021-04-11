import 'package:flutter/material.dart';

import './sidebar/sidebar.dart';
// ignore: directives_ordering
import '../../../core/init/helper/get_text.dart';
import '../../../core/widgets/app_bar.dart';
import 'info_screen.dart';

class UnauthorizedHomeScreen extends StatefulWidget {
  @override
  _UnauthorizedHomeScreenState createState() => _UnauthorizedHomeScreenState();
}

class _UnauthorizedHomeScreenState extends State<UnauthorizedHomeScreen> {
  String currentType = 'users';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            getAppBar(context: context, title: getText(context, 'home_screen')),
        body: Row(
          children: [
            Expanded(
                flex: 2,
                child: SideBar(changePage: changePage, type: currentType)),
            Expanded(flex: 9, child: InfoScreen(type: currentType))
          ],
        ));
  }

  void changePage(String text) {
    if (text == 'users' || text == 'roles' || text == 'departments') {
      setState(() {
        currentType = text;
      });
    }
  }
}
