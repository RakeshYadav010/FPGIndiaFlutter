import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fpg_india/models/response_fpg.dart';
import 'package:fpg_india/network/service.dart';
import 'package:fpg_india/utils/functions.dart';
import 'package:fpg_india/utils/routes.dart';
import 'package:fpg_india/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var message;
  late ResponseFpg fpg = new ResponseFpg();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              fpg.data == null ? Text("") : _SetSection(fpg),
              fpg.data == null ? Text("") : _SetSection2nd(fpg),
              fpg.data == null ? Text("") : _SetSection3rd(fpg).px32().expand(),
              fpg.data == null ? Text("") : _SetSection4th(fpg),
              fpg.data == null ? Text("") : _SetSection5th(fpg),
              fpg.data == null ? Text("") : _SetSection6th(fpg),
              fpg.data == null ? Text("") : _SetSection7th(fpg),
              fpg.data == null ? Text("") : _SetSection9th(fpg),
              fpg.data == null ? Text("") : _SetSection8th(fpg),
              Divider(),
            ]))
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Image.asset("assets/images/fpgindia.png"),
            iconSize: 64.0,
            onPressed: null,
          ),
        ],
      ),
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: IconButton(
              icon: Image.asset("assets/images/menu.PNG"),
              onPressed: () {
                Scaffold.of(context).openDrawer();
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
    callAPI();
  }

  Future<void> callAPI() async {
    var url = Uri.parse(Services.url_fpg);
    var response =
        await http.post(url, body: {'api_token': Services.api_token});
    print('Response body: ${response.body}');
    var data = jsonDecode(response.body);

    setState(() {
      fpg = ResponseFpg.fromJson(data);
    });

    print(await http.read(Uri.parse(Services.url_fpg)));
  }
}

class _SetSection extends StatelessWidget {
  late ResponseFpg fpg = new ResponseFpg();

  _SetSection(ResponseFpg data) {
    fpg = data;
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              const Color(0xAE80C8D7),
              const Color(0xFFF8F9FA),
            ],
            begin: const FractionalOffset(0.0, 1.0),
            end: const FractionalOffset(0.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 7.0),
                child: Text(
                  fpg.data!.content!.section!.title.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Color(0xff0085ff)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 0.0, bottom: 0.0, left: 16.0, right: 16.0),
                child: Text(
                  fpg.data!.content!.section!.description.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: Html(
                  data: fpg.data!.content!.section!.description2.toString(),
                  style: {
                    "body": Style(
                      fontSize: FontSize(15.0),
                      color: Colors.black,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.normal,
                    ),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                        side: BorderSide(
                          color: Color(0xff0085ff),
                          width: 0.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Join First Price Group',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    MyFunctions.showToast("Put your message here");
                  },
                ),
              ),
              Image.network(fpg.data!.content!.section!.image.toString()),
            ],
          ),
        ),
      ),
    );
  }
}

class _SetSection2nd extends StatelessWidget {
  late ResponseFpg fpg = new ResponseFpg();

  _SetSection2nd(ResponseFpg data) {
    fpg = data;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Image.network(fpg.data!.content!.section2nd!.image.toString()),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: Html(
                data: fpg.data!.content!.section2nd!.description4.toString(),
                style: {
                  "body": Style(
                    fontSize: FontSize(15.0),
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.normal,
                  ),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 7.0),
              child: Text(
                fpg.data!.content!.section2nd!.title.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Color(0xff0085ff)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, bottom: 0.0, left: 16.0, right: 16.0),
              child: Text(
                fpg.data!.content!.section2nd!.description.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: Html(
                data: fpg.data!.content!.section2nd!.description2.toString(),
                style: {
                  "body": Style(
                    fontSize: FontSize(15.0),
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.normal,
                  ),
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
              child: Html(
                data: fpg.data!.content!.section2nd!.description3.toString(),
                style: {
                  "body": Style(
                    fontSize: FontSize(15.0),
                    color: Colors.black,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.normal,
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SetSection3rd extends StatelessWidget {
  late ResponseFpg fpg = new ResponseFpg();
  var description;

  _SetSection3rd(ResponseFpg data) {
    fpg = data;
    description = fpg.data!.content!.section3rd!.descriptionList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: Text(
            fpg.data!.content!.section3rd!.title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff0085ff)),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.network(
                      description[index].image.toString(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: Html(
                      data: description![index].detail.toString(),
                      style: {
                        "body": Style(
                          fontSize: FontSize(15.0),
                          color: Colors.black,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.normal,
                        ),
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: description.length,
        ),
      ],
    );
  }
}

class _SetSection4th extends StatelessWidget {
  late ResponseFpg fpg = new ResponseFpg();

  _SetSection4th(ResponseFpg data) {
    fpg = data;
  }

  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff1f6fa),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 12.0, bottom: 10.0, left: 16.0, right: 16.0),
                child: Html(
                  data: fpg.data!.content!.section4th!.title.toString(),
                  style: {
                    "body": Style(
                      fontSize: FontSize(22.0),
                      color: Colors.black54,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                    ),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0, top: 12.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                        side: BorderSide(
                          color: Color(0xff0085ff),
                          width: 0.0,
                        ),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      fpg.data!.content!.section4th!.description.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    MyFunctions.showToast("Put your message here");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SetSection5th extends StatelessWidget {
  late ResponseFpg fpg = new ResponseFpg();
  var description;

  _SetSection5th(ResponseFpg data) {
    fpg = data;
    description = fpg.data!.content!.section5th!.descriptionList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(fpg.data!.content!.section5th!.image.toString()),
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 8.0, left: 15.0, right: 15.0),
          child: Text(
            fpg.data!.content!.section5th!.title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff459e19)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 5.0, bottom: 20.0, left: 15.0, right: 15.0),
          child: Text(
            fpg.data!.content!.section5th!.description.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.network(
                        description[index].image.toString(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 0.0, bottom: 8.0, left: 0.0, right: 8.0),
                        child: Html(
                          data: description![index].detail.toString(),
                          style: {
                            "body": Style(
                              fontSize: FontSize(15.0),
                              color: Colors.black,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.normal,
                            ),
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: description.length,
        ),
      ],
    );
  }
}

class _SetSection6th extends StatelessWidget {
  late ResponseFpg fpg = new ResponseFpg();

  _SetSection6th(ResponseFpg data) {
    fpg = data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Image.network(fpg.data!.content!.section6th!.image.toString()),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 8.0, left: 15.0, right: 15.0),
          child: Text(
            fpg.data!.content!.section6th!.title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xff0085ff)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 5.0, bottom: 10.0, left: 45.0, right: 45.0),
          child: Text(
            fpg.data!.content!.section6th!.description.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 1.0, bottom: 10.0, left: 16.0, right: 16.0),
          child: Html(
            data: fpg.data!.content!.section6th!.description2.toString(),
            style: {
              "body": Style(
                fontSize: FontSize(16.0),
                color: Colors.black54,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.normal,
              ),
            },
          ),
        ),
      ],
    );
  }
}

class _SetSection7th extends StatelessWidget {
  late ResponseFpg fpg = new ResponseFpg();

  _SetSection7th(ResponseFpg data) {
    fpg = data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 8.0, left: 20.0, right: 20.0),
          child: Text(
            fpg.data!.content!.section7th!.title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff0085ff)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 15.0, left: 20.0, right: 20.0),
          child: Container(
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Image.network(
                        fpg.data!.content!.section7th!.image.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 10.0, left: 45.0, right: 45.0),
                    child: Text(
                      fpg.data!.content!.section7th!.description.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff0085ff)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 1.0, bottom: 10.0, left: 16.0, right: 16.0),
                    child: Html(
                      data: fpg.data!.content!.section7th!.description2
                          .toString(),
                      style: {
                        "body": Style(
                          fontSize: FontSize(16.0),
                          color: Colors.black54,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.normal,
                        ),
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SetSection9th extends StatelessWidget {
  late ResponseFpg fpg = new ResponseFpg();

  _SetSection9th(ResponseFpg data) {
    fpg = data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 8.0, left: 20.0, right: 20.0),
          child: Text(
            fpg.data!.content!.section9th!.title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 15.0, left: 20.0, right: 20.0),
          child: Container(
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Image.network(
                        fpg.data!.content!.section9th!.image1.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 45.0, right: 45.0),
                    child: Text(
                      fpg.data!.content!.section9th!.description1En.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff0085ff)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 45.0, right: 45.0),
                    child: Text(
                      fpg.data!.content!.section9th!.description1Hi.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff0085ff)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                    child: ElevatedButton(
                      child: Text('View All'),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.absayTstmnlRoute);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          primary: Color(0xff5ddc21),
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                          textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 15.0, left: 20.0, right: 20.0),
          child: Container(
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Image.network(
                        fpg.data!.content!.section9th!.image2.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 45.0, right: 45.0),
                    child: Text(
                      fpg.data!.content!.section9th!.description2En.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff0085ff)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, left: 45.0, right: 45.0),
                    child: Text(
                      fpg.data!.content!.section9th!.description2Hi.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xff0085ff)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 10.0),
                    child: ElevatedButton(
                      child: Text('View All'),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.absayTstmnlRoute);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                          ),
                          primary: Color(0xff5ddc21),
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                          textStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SetSection8th extends StatelessWidget {
  late ResponseFpg fpg = new ResponseFpg();
  var description;
  var listData;

  _SetSection8th(ResponseFpg data) {
    fpg = data;
    description = fpg.data!.content!.section8th!.questions;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 15.0, bottom: 25.0, left: 15.0, right: 15.0),
          child: Text(
            fpg.data!.content!.section8th!.title.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Html(
                    data: description![index].question.toString(),
                    style: {
                      "body": Style(
                        fontSize: FontSize(17.0),
                        color: Colors.black87,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.normal,
                      ),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Html(
                    data: description![index].answer.toString(),
                    style: {
                      "body": Style(
                        fontSize: FontSize(15.0),
                        color: Colors.black54,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.normal,
                      ),
                    },
                  ),
                ),
                ListView.builder(
                    itemCount: description[index].list.length,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index1) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Html(
                          data:
                              description![index].list[index1].value.toString(),
                          style: {
                            "body": Style(
                              fontSize: FontSize(15.0),
                              color: Colors.black54,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.normal,
                            ),
                          },
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 22.0, right: 22.0, top: 8.0, bottom: 8.0),
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
              ],
            );
          },
          itemCount: description.length,
        ),
      ],
    );
  }
}
