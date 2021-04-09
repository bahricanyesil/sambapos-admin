import 'package:flutter/material.dart';
import '../../view/home/home_screen.dart';
import '../../view/login/login_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}

const String homeRoute = '/';
const String loginRoute = '/login';
