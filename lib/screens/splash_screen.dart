import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_page/Utility/Routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2200), () {
      Navigator.pushNamed(context, MyRoutes.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: AssetImage("assets/images/LOgo.jpg")),
    );
  }
}
