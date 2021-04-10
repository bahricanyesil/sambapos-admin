import 'package:flutter/material.dart';

import '../../view/home/authorized/authorized_home_screen.dart';
import '../../view/home/unauthorized/unauthorized_home.dart';
import '../../view/login/login_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case unauthorizedHomeRoute:
        return MaterialPageRoute(builder: (_) => UnauthorizedHomeScreen());
      case authorizedHomeRoute:
        return MaterialPageRoute(builder: (_) => AuthorizedHomeScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}

const String unauthorizedHomeRoute = '/unauthorized';
const String authorizedHomeRoute = '/authorized';
const String loginRoute = '/login';
