import 'package:flutter/material.dart';
import './utils/routes/routeName.dart';
import './utils/routes/route.dart';
import './view_model/authViewModel.dart';
import './view_model/userViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MVVMTest());

class MVVMTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => UserViewModel()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        initialRoute: RouteNames.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
