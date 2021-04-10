import 'package:flutter/material.dart';

import '../../../core/init/helper/get_text.dart';
import '../../../core/widgets/app_bar.dart';
import './sidebar/sidebar.dart';

class UnauthorizedHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            getAppBar(context: context, title: getText(context, 'home_screen')),
        body: Row(
          children: [
            Expanded(flex: 1, child: SideBar()),
            Expanded(
              flex: 6,
              child: Center(
                child: Text('yes'),
              ),
            )
          ],
        ));
  }
}
