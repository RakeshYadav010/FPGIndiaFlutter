import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fpg_india/models/response_faqs.dart';
import 'package:fpg_india/network/service.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class FaqsPage extends StatefulWidget {
  const FaqsPage({Key? key}) : super(key: key);

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
  var message;
  late RespFaqsData faqs = new RespFaqsData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              faqs.data == null ? Text("") : _SetListData(faqs).expand(),
              Divider(),
            ]))
          ],
        ),
      ),
      // drawer: MyDrawer(),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            faqs.data!.topHeader.toString(),
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
    callAPI();

  }

  Future<void> callAPI() async {
    var url = Uri.parse(Services.url_faqs);
    var response =
        await http.post(url, body: {'api_token': Services.api_token});
    print('Response body: ${response.body}');
    var data = jsonDecode(response.body);

    setState(() {
      faqs = RespFaqsData.fromJson(data);
    });
    print(await http.read(Uri.parse(Services.url_faqs)));
  }
}

class _SetListData extends StatelessWidget {
  late RespFaqsData fpg = new RespFaqsData();
  var description;

  _SetListData(RespFaqsData data) {
    fpg = data;
    description = fpg.data!.description;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                color: Color(0xdaf3f2f2),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 40,
                          child: VerticalDivider(width: 3, color: Colors.red)),
                      Text(
                        " Q.   ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            color: Colors.red),
                      ),
                      Expanded(
                        child: Text(
                          description[index].title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 40,
                          child: VerticalDivider(width: 3, color: Colors.grey)),
                      Text(
                        " A.   ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 22,
                            color: Colors.grey),
                      ),
                      Expanded(
                        child: Html(
                          data: description[index].note,
                          style: {
                            "body": Style(
                              fontSize: FontSize(14.0),
                              color: Colors.black,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.normal,
                            ),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 30,
                color: Colors.white,
                child: Divider(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
            ],
          );
        },
        itemCount: description.length,
      ),
    );
  }
}
