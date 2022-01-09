import 'package:flutter/material.dart';
import 'package:fpg_india/pages/YoutubePlayerDemoApp.dart';
import 'package:fpg_india/pages/absay_tstmnl_page.dart';
import 'package:fpg_india/pages/contactus_page.dart';
import 'package:fpg_india/pages/faqs_page.dart';
import 'package:fpg_india/pages/home_page.dart';
import 'package:fpg_india/pages/login_page.dart';
import 'package:fpg_india/utils/routes.dart';
import 'package:fpg_india/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.faqsRoute: (context) => FaqsPage(),
        MyRoutes.contactRoute: (context) => ContactUsPage(),
        MyRoutes.absayTstmnlRoute: (context) => AbsayTstmnlPage(),
        // MyRoutes.youtubeRoute: (context) => YoutubePlayerDemoApp(),
      },
    );
  }
}
