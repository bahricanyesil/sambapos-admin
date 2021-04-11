import 'package:flutter/material.dart';

import '../model/role_model.dart';
import 'dummy_user_data.dart';

List<Role> roles = [
  Role(name: 'Developer', icon: Icons.code_outlined),
  Role(name: 'Designer', icon: Icons.design_services_outlined),
  Role(name: 'Marketing Expert', icon: Icons.attach_money_outlined)
];

List<Role> getRoles() => roles;

void editRoleItem(String oldName, String newName) {
  var index = roles.indexWhere((element) => element.name == oldName);
  if (index == -1) return;
  roles[index].name = newName;
  for (var index = 0; index < users.length; index++) {
    if (users[index].role.name == oldName) {
      users[index].role.name = newName;
    }
  }
}

void deleteRoleItem(String oldName) {
  roles.removeWhere((element) => element.name == oldName);
  for (var index = 0; index < users.length; index++) {
    if (users[index].role.name == oldName) {
      users[index].role.name = 'No Role';
      users[index].role.icon = Icons.close_outlined;
    }
  }
}
