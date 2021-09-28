import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpg_india/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 25),
              CircleAvatar(
                backgroundColor: Colors.black26,
                radius: 50.0,
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Image.asset('assets/images/logowhite.png'),
                ),
              ),
              SizedBox(height: 7),
              Text(
                "Welcome to FPG",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white),
              ),
              SizedBox(height: 3),
              Text(
                "A unique way to buy properties",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                    color: Colors.white),
              ),
              SizedBox(height: 15),
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
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
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
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25)),
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
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                          color: Colors.black54),
                                    ),
                                    Text(
                                      "SignUp",
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
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
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(25)),
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
      ),
    );
  }
}
