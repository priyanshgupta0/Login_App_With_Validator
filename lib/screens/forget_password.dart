import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Forget extends StatelessWidget {
  const Forget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.white,
      appBar: AppBar(title: "Forget Password".text.make(),),
    );
  }
}