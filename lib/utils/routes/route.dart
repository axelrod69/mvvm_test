import 'package:flutter/material.dart';
import '../../view/homeScreen.dart';
import '../../view/loginScreen.dart';
import '../../view/splashScreen.dart';
import './routeName.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => SplashScreen());

      case RouteNames.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen());

      case RouteNames.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Routes'),
            ),
          );
        });
    }
  }
}
