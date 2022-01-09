import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fpg_india/utils/functions.dart';
import 'package:http/http.dart' as http;
import 'package:fpg_india/network/service.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
            child: Stack(children: <Widget>[
          _InputFormAndData(),
        ])));
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Contact Us',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.black),
          ),
        ],
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: IconButton(
              icon: Image.asset("assets/images/back.png"),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  SystemNavigator.pop();
                }
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // callAPI();
  }

  Future<void> callAPI() async {
    var url = Uri.parse(Services.url_faqs);
    var response =
        await http.post(url, body: {'api_token': Services.api_token});
    print('Response body: ${response.body}');
    var data = jsonDecode(response.body);

    setState(() {
      // faqs = RespData.fromJson(data);
    });
    print(await http.read(Uri.parse(Services.url_faqs)));
  }
}

class _InputFormAndData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Enquire Now',
            maxLines: 1,
            textAlign: TextAlign.left,
            style: new TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
            maxLength: 30,
            maxLines: 1,
            textCapitalization: TextCapitalization.words,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email ID',
            ),
            maxLength: 30,
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contact Number',
            ),
            maxLength: 10,
            maxLines: 1,
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Subject',
            ),
            maxLines: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Message',
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 40.0, top: 30.0),
            child: ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                MyFunctions.showToast("Put your message here");
              },
              style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                  primary: Color(0xffec1818),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                  textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        Container(
          color: Color(0xff009bd5),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'New Delhi (Corporate Office)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.location,
                    color: Colors.white,
                  ),
                  title: Text(
                    "IPAN Real Estate Pvt. Ltd. 10/58, Second Floor, Kirti Nagar Industrial Area, New Delhi-110015",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.phone,
                  color: Colors.white,
                ),
                title: Text(
                  "011-6901 0010",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ListTile(
                  leading: Icon(
                    CupertinoIcons.mail,
                    color: Colors.white,
                  ),
                  title: Text(
                    "contact@ipanworld.in",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
