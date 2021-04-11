import 'role_model.dart';

class User {
  String email;
  String password;
  Role role;
  int authorityLevel;

  User(
      {required this.email,
      required this.password,
      this.authorityLevel = 1,
      required this.role});
}
