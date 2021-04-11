import 'package:flutter/material.dart';
import '../model/department_model.dart';

List<Department> departments = [
  Department(name: 'IT', icon: Icons.code_outlined),
  Department(name: 'Business', icon: Icons.work_outline_outlined),
  Department(name: 'Design', icon: Icons.design_services_outlined)
];

void editDepartmentItem(String oldName, String newName) {
  var index = departments.indexWhere((element) => element.name == oldName);
  if (index == -1) return;
  departments[index].name = newName;
}

void deleteDepartmentItem(String oldName) {
  departments.removeWhere((element) => element.name == oldName);
}
