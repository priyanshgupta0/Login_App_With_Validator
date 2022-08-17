import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Utility/Routes.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool changeButton = false;
  bool agree = false;
  String password1 = "";
  String password2 = "";
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.white,
      appBar: AppBar(
        title: "Register".text.make(),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/LOgo.jpg",
                  height: 70,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ).p8().centered(),
                "Create your account".text.xl3.semiBold.make(),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Enter Your E-mail",
                            labelText: "E-mail"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Enter Username",
                            labelText: "Create Username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Enter Password",
                            labelText: "Create Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else if (value.length < 6) {
                            return "Password length must be atleast 8";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password1 = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Re-enter Password",
                            labelText: "Confirm Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          } else if (value.length < 6) {
                            return "Password length must be atleast 8";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password2 = value;
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            hintText: "Enter Number",
                            labelText: "Phone Number"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required";
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Material(
                            color: Colors.white,
                            child: Checkbox(
                              value: agree,
                              onChanged: (value) {
                                setState(() {
                                  agree = value ?? false;
                                });
                              },
                            ),
                          ),
                          "I have read and accept terms and conditions"
                              .text
                              .xs
                              .make(),
                        ],
                      ),
                      Material(
                        color: (changeButton && agree)
                            ? Color.fromARGB(255, 0, 196, 88)
                            : Colors.cyan,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 10),
                        child: InkWell(
                          onTap: () async => {
                            if (password1 != password2)
                              {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext builder) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: Text("Invalid"),
                                        content: Text(
                                            "Password and Confirm Password must be same"),
                                        // actions: [FlatButton(child: "OK".text.make())],
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pushNamed(context,
                                                    MyRoutes.RegisterRoute);
                                              },
                                              child: "Ok".text.make())
                                        ],
                                        elevation: 24,
                                      );
                                    })
                              }
                            else if (formkey.currentState!.validate() && agree)
                              {
                                setState(() {
                                  changeButton = true;
                                }),
                                await Future.delayed(
                                    const Duration(seconds: 1)),
                                Navigator.pushNamed(
                                    context, MyRoutes.loginRoute),
                                setState(() {
                                  changeButton = false;
                                  agree = false;
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
                                    "Create Account",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
