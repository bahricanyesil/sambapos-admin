import 'package:flutter/material.dart';

import '../../../../core/init/helper/get_text.dart';
import '../../../../core/init/screen/screen_config.dart';
import '../../../../core/widgets/divider.dart';
import 'components/side_bar_item.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // If we have more items or dynamic structure, we can user list view instead of  column
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          SizedBox(height: Sc.height!),
          getSideBarItem(Icons.people_alt_outlined, 'users', context),
          getSideBarItem(Icons.security_outlined, 'roles', context),
          getSideBarItem(Icons.home_work_outlined, 'departments', context)
        ],
      ),
    );
  }

  Widget getSideBarItem(IconData icon, String text, BuildContext context) {
    return Column(
      children: [
        SideBarItem(
            onPressed: () => {}, icon: icon, title: getText(context, text)),
        DividerWidget(),
      ],
    );
  }
}
