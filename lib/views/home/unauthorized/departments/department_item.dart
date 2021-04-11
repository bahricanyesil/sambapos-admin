import 'package:flutter/material.dart';

import '../../../../core/decoration/container.dart';
import '../../../../core/init/screen/screen_config.dart';
import '../../../../core/model/department_model.dart';

class DepartmentItem extends StatelessWidget {
  final Department department;
  final Function editDepartment;
  final Function deleteDepartment;
  const DepartmentItem(
      {required this.department,
      required this.editDepartment,
      required this.deleteDepartment});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Sc.width! * 1.5),
        margin: EdgeInsets.only(bottom: Sc.height! * 2),
        height: Sc.height! * 12,
        decoration: ContainerDeco().infoItem(context),
        child: Row(
          children: [
            departmentIcon(context),
            departmentText(context),
            Spacer(),
            editButton(context),
            SizedBox(width: Sc.width!),
            deleteButton(context)
          ],
        ));
  }

  Widget departmentIcon(context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Sc.height!, bottom: Sc.height!, right: Sc.width! * 1.5),
      child:
          Icon(department.icon, color: Colors.black87, size: Sc.image! * 3.3),
    );
  }

  Widget departmentText(context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sc.width!),
      child: Text(department.name,
          style: Theme.of(context).textTheme.headline3!.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: Sc.width! * 1.2 + Sc.height! * .6)),
    );
  }

  Widget editButton(context) {
    return IconButton(
        icon: Icon(Icons.edit_outlined,
            color: Theme.of(context).primaryColor, size: Sc.image! * 3.1),
        onPressed: () => editDepartment(department.name));
  }

  Widget deleteButton(context) {
    return IconButton(
        icon: Icon(Icons.delete_outline,
            color: Theme.of(context).errorColor, size: Sc.image! * 2.9),
        onPressed: () => deleteDepartment(department.name));
  }
}
