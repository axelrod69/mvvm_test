import 'package:flutter/material.dart';
import './utils/routes/routeName.dart';
import './utils/routes/route.dart';
import './view_model/authViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MVVMTest());

class MVVMTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel())
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        initialRoute: RouteNames.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
