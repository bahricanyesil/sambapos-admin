class User {
  String email;
  String password;
  int authorityLevel;

  User({required this.email, required this.password, this.authorityLevel = 1});
}
