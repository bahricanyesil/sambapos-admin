import 'package:flutter/material.dart';

import '../../views/home/authorized/authorized_home_screen.dart';
import '../../views/home/unauthorized/unauthorized_home.dart';
import '../../views/home/unauthorized/users/edit_user.dart';
import '../../views/login/login_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case unauthorizedHomeRoute:
        return MaterialPageRoute(builder: (_) => UnauthorizedHomeScreen());
      case authorizedHomeRoute:
        return MaterialPageRoute(builder: (_) => AuthorizedHomeScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case editUserRoute:
        return MaterialPageRoute(
            builder: (_) => EditUser(),
            settings: RouteSettings(arguments: settings.arguments));
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}

const String unauthorizedHomeRoute = '/unauthorized';
const String authorizedHomeRoute = '/authorized';
const String loginRoute = '/login';
const String editUserRoute = '/editUser';
