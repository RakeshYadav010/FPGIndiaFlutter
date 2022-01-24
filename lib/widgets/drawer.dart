import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpg_india/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media.wired.com/photos/5ec70372c96258473f891964/125:94/w_2279,h_1714,c_limit/Biz-pichai-h_15151797.jpg";
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color(0xFF0C5280),
                const Color(0xFF32BFC4),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          const Color(0xFF1D5A82),
                          const Color(0xFF26CCD2),
                        ],
                        begin: const FractionalOffset(0.0, 1.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  margin: EdgeInsets.zero,
                  accountName: Text("Rakesh N Droid"),
                  accountEmail: Text("rakeshndroiddev@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                )),
            Container(
              color: Colors.black54,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Register",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Container(
                      height: 40,
                      child: VerticalDivider(width: 1, color: Colors.white)),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                    child: new Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, MyRoutes.faqsRoute);
              },
              child: ListTile(
                leading: Icon(
                  Icons.question_answer,
                  color: Colors.white,
                ),
                title: Text(
                  "Faq's",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            new GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, MyRoutes.contactRoute);
              },
              child: ListTile(
                leading: Icon(
                  Icons.contact_mail_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Contact Us",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: Text(
                "Logout",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
