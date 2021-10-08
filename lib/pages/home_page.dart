import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpg_india/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

// GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FPG India"),
      ),
      body: Center(
          child: Text(
        '30 days of Flutter!',
      )),
      drawer: MyDrawer(),
    );
  }
}
