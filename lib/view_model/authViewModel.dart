import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_test/repository/authRepository.dart';
import 'package:mvvm_test/utils/routes/routeName.dart';
import '../utils/utilSettings.dart';

class AuthViewModel with ChangeNotifier {
  final myRepo = AuthRepository();

  bool _loading = false;

  bool get loading {
    return _loading;
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    myRepo.loginApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RouteNames.home);
      UtilSettings.snackBarMessage('Login Successfully', context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      UtilSettings.snackBarMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    myRepo.signUpApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RouteNames.home);
      UtilSettings.snackBarMessage('Sign Up Successful', context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      UtilSettings.snackBarMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
