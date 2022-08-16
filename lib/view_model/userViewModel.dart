import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/userModel.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(Payload user) async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();
    localStorage.setString('token', user.access.toString());
    notifyListeners();
    return true;
  }

  Future<Payload> getUser() async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();
    final String? token = localStorage.getString('token');

    return Payload(access: token.toString());
  }

  Future<bool> logOut() async {
    final SharedPreferences localStorage =
        await SharedPreferences.getInstance();

    localStorage.remove('token');
    return true;
  }
}
