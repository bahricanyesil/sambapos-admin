import 'package:flutter/material.dart';

import '../../../core/dummy/dummy_departments.dart';
import '../../../core/dummy/dummy_roles.dart';
import '../../../core/dummy/dummy_user_data.dart';
import '../../../core/init/screen/screen_config.dart';
import '../../../core/model/role_model.dart';
import 'departments/department_item.dart';
import 'functions/edit_text.dart';
import 'roles/role_item.dart';
import 'users/components/user_item.dart';

class InfoScreen extends StatefulWidget {
  final String type;
  const InfoScreen({required this.type});

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  List<Role> roles = [];

  @override
  void initState() {
    super.initState();
    roles = getRoles();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Sc.height! * 5,
          left: Sc.width! * 2,
          right: Sc.width! * 2,
          bottom: Sc.height! * 3),
      child: ListView.builder(
          itemCount: widget.type == 'users'
              ? users.length
              : (widget.type == 'roles' ? roles.length : departments.length),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return getListItem(index);
          }),
    );
  }

  Widget getListItem(index) {
    if (widget.type == 'users') {
      return UserItem(userIndex: index);
    } else if (widget.type == 'roles') {
      return RoleItem(
          role: roles[index],
          editRole: editRolSetState,
          deleteRole: deleteRolSetState);
    } else if (widget.type == 'departments') {
      return DepartmentItem(
          department: departments[index],
          editDepartment: editDepartmentSetState,
          deleteDepartment: deleteDepartmentSetState);
    }
    return Container();
  }

  void editRolSetState(initialText) async {
    var newRoleName = await editText(initialText, context);
    setState(() {
      editRoleItem(initialText, newRoleName);
    });
  }

  void deleteRolSetState(initialText) {
    setState(() {
      deleteRoleItem(initialText);
    });
  }

  void editDepartmentSetState(initialText) async {
    var newDepartmentName = await editText(initialText, context);
    setState(() {
      editDepartmentItem(initialText, newDepartmentName);
    });
  }

  void deleteDepartmentSetState(initialText) {
    setState(() {
      deleteDepartmentItem(initialText);
    });
  }
}
