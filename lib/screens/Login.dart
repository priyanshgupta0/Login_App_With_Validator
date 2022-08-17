import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utility/Routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool changeButton = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/LOgo.jpg',
                  fit: BoxFit.cover,
                ).p64(),
                "Welcome to INURUM".text.xl4.bold.make(),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Enter User Name",
                            labelText: "User Name"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Enter Password",
                            labelText: "Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length must be atleast 8";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Material(
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            child: "Forgot Password?"
                                .text
                                .xs
                                .end
                                .color(Colors.blue)
                                .make(),
                            onTap: () => Navigator.pushNamed(
                                context, MyRoutes.ForgetRoute),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        color: changeButton
                            ? Color.fromARGB(255, 0, 196, 88)
                            : Colors.cyan,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 10),
                        child: InkWell(
                          onTap: () async => {
                            if (formkey.currentState!.validate())
                              {
                                setState(() {
                                  changeButton = true;
                                }),
                                await Future.delayed(
                                    const Duration(seconds: 1)),
                                Navigator.pushNamed(
                                    context, MyRoutes.HomeRoute),
                                setState(() {
                                  changeButton = false;
                                }),
                              }
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Log In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        child: Text("Or"),
                      ),
                      SizedBox(height: 5),
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          child:
                              "Register Now".text.xl.color(Colors.blue).make(),
                          onTap: () => Navigator.pushNamed(
                              context, MyRoutes.RegisterRoute),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
