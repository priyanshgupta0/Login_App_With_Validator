import 'package:flutter/material.dart';
import 'package:login_page/screens/Login.dart';
import 'package:login_page/screens/Regiser_now.dart';
import 'package:login_page/screens/forget_password.dart';
import 'package:login_page/screens/home.dart';
import 'package:login_page/screens/splash_screen.dart';
import 'Utility/Routes.dart';
import 'screens/Login.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.splashRoute,
      routes: {
        "/": (context) => Login(),
        MyRoutes.splashRoute: (context) => SplashScreen(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.HomeRoute: (context) => Home(),
        MyRoutes.RegisterRoute: (context) => Register(),
        MyRoutes.ForgetRoute: (context) => Forget(),
      },
    );
  }
}
  