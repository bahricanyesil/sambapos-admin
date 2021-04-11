import 'package:flutter/material.dart';

import '../../../../core/decoration/container.dart';
import '../../../../core/init/screen/screen_config.dart';
import '../../../../core/model/role_model.dart';

class RoleItem extends StatelessWidget {
  final Role role;
  final Function editRole;
  final Function deleteRole;
  const RoleItem(
      {required this.role, required this.editRole, required this.deleteRole});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Sc.width! * 1.5),
        margin: EdgeInsets.only(bottom: Sc.height! * 2),
        height: Sc.height! * 12,
        decoration: ContainerDeco().infoItem(context),
        child: Row(
          children: [
            roleIcon(context),
            roleText(context),
            Spacer(),
            editButton(context),
            SizedBox(width: Sc.width!),
            deleteButton(context)
          ],
        ));
  }

  Widget roleIcon(context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Sc.height!, bottom: Sc.height!, right: Sc.width! * 1.5),
      child: Icon(role.icon, color: Colors.black87, size: Sc.image! * 3.3),
    );
  }

  Widget roleText(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sc.width!),
      child: Text(role.name,
          style: Theme.of(context).textTheme.headline3!.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: Sc.width! * 1.2 + Sc.height! * .6)),
    );
  }

  Widget editButton(context) {
    return IconButton(
        icon: Icon(Icons.edit_outlined,
            color: Theme.of(context).primaryColor, size: Sc.image! * 3.1),
        onPressed: () => editRole(role.name));
  }

  Widget deleteButton(context) {
    return IconButton(
        icon: Icon(Icons.delete_outline,
            color: Theme.of(context).errorColor, size: Sc.image! * 2.9),
        onPressed: () => deleteRole(role.name));
  }
}
