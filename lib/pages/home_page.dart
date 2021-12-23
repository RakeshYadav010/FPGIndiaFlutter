import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpg_india/models/response_faqs.dart';
import 'package:fpg_india/utils/functions.dart';
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
  late RespData faQs = new RespData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          faQs.data == null ? Text("") : _CartListState(faQs).px32().expand(),
          Divider(),
          faQs.data == null ? Text("") : _CartTotal(faQs),
        ],
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
    var url = Uri.parse('https://fpgindia.in/api/Fpg/v1/faqs');
    var response = await http.post(url, body: {
      'api_token': '6hrFDATxrG9w14QY9!VhLE0Wg6LIvwOwJfRp4rs8Mzozk5xhSkw0_MQ'
    });
    print('Response body: ${response.body}');
    var data = jsonDecode(response.body);

    setState(() {
      faQs = RespData.fromJson(data);
    });

    print(await http.read(Uri.parse('https://fpgindia.in/api/Fpg/v1/faqs')));
  }
}

class _CartListState extends StatelessWidget {
  late RespData faQs = new RespData();
  var description;

  _CartListState(RespData data) {
    faQs = data;
    description = faQs.data!.description;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(description[index].title),
            onTap: () {
              MyFunctions.showToast(index.toString() + " index is clicked");
            },
          ),
        );
      },
      itemCount: description.length,
    );
  }
}

class _CartTotal extends StatelessWidget {
  late RespData faQs = new RespData();

  _CartTotal(RespData data) {
    faQs = data;
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Row(
            children: [
              faQs == null
                  ? Text("")
                  : faQs.data!.topHeader!.text.xl4
                      .color(Colors.red)
                      .make()
                      .p32(),
            ],
          ),
          OutlinedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
              side: MaterialStateProperty.resolveWith<BorderSide>(
                  (Set<MaterialState> states) {
                final Color color = states.contains(MaterialState.pressed)
                    ? Colors.blue
                    : Colors.black54;
                return BorderSide(color: color, width: 1);
              }),
            ),
            onPressed: () {
              MyFunctions.showToast("Put your message here");
            },
            child: Text('Click Me'),
          )
        ],
      ),
    );
  }
}
