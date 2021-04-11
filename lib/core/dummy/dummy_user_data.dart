import 'package:flutter/material.dart';
import '../model/role_model.dart';
import '../model/user_model.dart';

List<User> users = [
  User(
    email: 'bahricanyesil@gmail.com',
    password: '123456',
    authorityLevel: 2,
    role: Role(icon: Icons.code_outlined, name: 'Developer'),
  ),
  User(
    email: 'vehbi@sambapos.com',
    password: '12345678',
    authorityLevel: 2,
    role: Role(icon: Icons.code_outlined, name: 'Developer'),
  ),
  User(
    email: 'demo@gmail.com',
    password: '123456',
    authorityLevel: 1,
    role: Role(icon: Icons.close_outlined, name: 'No Role'),
  )
];