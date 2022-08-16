import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/userViewModel.dart';
import '../utils/routes/routeName.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserViewModel>(context).logOut();
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text('TEXXXXXXXXXXXXXT')),
          Center(
              child: InkWell(
                  onTap: () {
                    provider.then((value) =>
                        Navigator.pushNamed(context, RouteNames.login));
                  },
                  child: Text('LOGOUT')))
        ],
      ),
    );
  }
}
