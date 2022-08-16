import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/routes/routeName.dart';
import '../userViewModel.dart';
import '../../model/userModel.dart';

class SplashServices {

  Future<Payload> getToken() => UserViewModel().getUser();

  void authenticate(BuildContext context) async {
    // SharedPreferences localStorage = await SharedPreferences.getInstance();

    // String? token = localStorage.getString('token');

    getToken().then((value) {
      if (value.access == null || value.access == '') {
        Navigator.pushNamed(context, RouteNames.login);
      } else {
        Navigator.pushNamed(context, RouteNames.home);
      }
    }).onError((error, stackTrace) {
      if(kDebugMode) {
        print(error.toString());
      }
    });
  }
}
