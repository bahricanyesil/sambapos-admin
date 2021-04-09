import '../model/user_model.dart';

List<User> getDummyUsers() {
  return [
    User(email: 'bahricanyesil@gmail.com', password: '123456', authorityLevel: 1),
    User(email: 'vehbi@sambapos.com', password: '12345678', authorityLevel: 2),
    User(email: 'demo@gmail.com', password: '1234', authorityLevel: 1),
  ];
}
