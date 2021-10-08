import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpg_india/utils/functions.dart';
import 'package:fpg_india/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _userID = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: ClipPath(
                      clipper: ClippingClass(),
                      child: Container(
                        height: 450.0,
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                    ),
                  ),

                  Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        CircleAvatar(
                          backgroundColor: Colors.black26,
                          radius: 50.0,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Image.asset('assets/images/logowhite.png'),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Welcome to FPG",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "A unique way to buy properties",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 260, left: 20.0, right: 20.0, bottom: 0.0),
                    color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 10.0,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                TextField(
                                  maxLength: 30,
                                  maxLines: 1,
                                  controller: _userID,
                                  textAlign: TextAlign.left,
                                  decoration: InputDecoration(
                                      hintText: "Enter Email ID or Mobile No",
                                      label: Text("Email ID or Mobile No"),
                                      border: OutlineInputBorder(
                                        borderRadius: const BorderRadius.all(
                                          const Radius.circular(3.0),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Material(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(25),
                                  child: InkWell(
                                    onTap: () {
                                      var userDetail = _userID.text;

                                      if (MyFunctions().isNumeric(userDetail)) {
                                        if (MyFunctions()
                                            .isValidMobile(userDetail)) {
                                          MyFunctions.showToast(
                                              "Call API Here!");
                                        } else {
                                          MyFunctions.showToast(
                                              "Enter valid Email ID or Mobile No");
                                        }
                                      } else if (!EmailValidator.validate(
                                          userDetail)) {
                                        MyFunctions.showToast(
                                            "Enter valid Email ID or Mobile No");
                                      } else {
                                        // Move for password login page...
                                        Navigator.pushNamed(
                                            context, MyRoutes.homeRoute);
                                      }
                                    },
                                    child: Container(
                                      height: 40,
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Next",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                "Don't have an account? ",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14.0,
                                                    color: Colors.black54),
                                              ),
                                              Text(
                                                "SignUp",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 14.0,
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ))),
                                SizedBox(
                                  height: 25,
                                ),
                                Center(
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: InkWell(
                                            onTap: () {
                                              MyFunctions.showToast(
                                                  "Working on it!");
                                              // Navigator.pushNamed(context, MyRoutes.homeRoute);
                                            },
                                            child: Container(
                                              height: 22,
                                              width: 65,
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Explore",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 12),
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                            ),
                                          ),
                                        ))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  // Positioned.fill(
                  //   child: Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Container(
                  //       height: 90.0,
                  //       width: 90.0,
                  //       decoration: BoxDecoration(
                  //         image: new DecorationImage(
                  //           image: new NetworkImage(
                  //               "https://media.wired.com/photos/5ec70372c96258473f891964/125:94/w_2279,h_1714,c_limit/Biz-pichai-h_15151797.jpg"),
                  //         ),
                  //         shape: BoxShape.circle,
                  //         border: Border.all(
                  //           color: Colors.white,
                  //           width: 5.0,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Image.network(
                        "https://ipanworld.in/assets/frontend/images/indian-city.png"),
                    // Text('Welcome to FPG India')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 80);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 80,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
