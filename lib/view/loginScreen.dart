import 'package:flutter/material.dart';
import '../utils/routes/routeName.dart';
import '../utils/utilSettings.dart';
import '../res/components/buttonStyle.dart';
import 'package:provider/provider.dart';
import '../view_model/authViewModel.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    final provider = Provider.of<AuthViewModel>(context);

    // TODO: implement build
    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter a valid email address';
                } else {
                  email = value;
                }
              },
            ),
            SizedBox(height: height * 0.04),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Password';
                } else {
                  password = value;
                }
              },
            ),
            SizedBox(height: height * 0.04),
            StyleOfButton(
                title: 'Login',
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    Map<String, dynamic> data = {
                      'email': email,
                      'password': password
                    };
                    print(data);
                    var response = Provider.of<AuthViewModel>(context, listen: false).loginApi(data, context);
                  }
                })
          ],
        ),
      ),
      // body: Center(
      //   child: TextButton(
      //       onPressed: () {
      //         Navigator.pushNamed(context, RouteNames.home);
      //         UtilSettings.snackBarMessage('Going To Home Screen', context);
      //       },
      //       child: const Text('Click Here')),
      // ),
    );
  }
}
