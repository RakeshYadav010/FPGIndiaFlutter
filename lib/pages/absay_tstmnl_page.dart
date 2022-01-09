import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fpg_india/models/response_absay_tstmnl_entity.dart';
import 'package:fpg_india/network/service.dart';
import 'package:fpg_india/utils/routes.dart';
import 'package:http/http.dart' as http;

import 'YoutubePlayerDemoApp.dart';

class AbsayTstmnlPage extends StatefulWidget {
  const AbsayTstmnlPage({Key? key}) : super(key: key);

  @override
  State<AbsayTstmnlPage> createState() => _AbsayTstmnlPageState();
}

class _AbsayTstmnlPageState extends State<AbsayTstmnlPage> {
  var message;
  late ResponseAbsayTstmnlEntity faqs = new ResponseAbsayTstmnlEntity();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildListDelegate([
              faqs.data == null
                  ? Text("")
                  : _SetListData(faqs, faqs.data!.project),
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
            'ABSAY Previous Project',
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
    var url = Uri.parse(Services.url_absay_pre_pro_tesmy);
    var response =
        await http.post(url, body: {'api_token': Services.api_token});
    print('Response body: ${response.body}');
    var data = jsonDecode(response.body);

    setState(() {
      faqs = ResponseAbsayTstmnlEntity.fromJson(data);
    });
    print(await http.read(Uri.parse(Services.url_absay_pre_pro_tesmy)));
  }
}

class _SetListData extends StatelessWidget {
  late ResponseAbsayTstmnlEntity absayData = new ResponseAbsayTstmnlEntity();
  List<ResponseAbsayTstmnlDataProject> description = [];

  _SetListData(this.absayData, this.description);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xff1c2331),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                child: Text(
                  'Akhil Bhartiya Shuraksha Awaas Yojna',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, bottom: 25.0, left: 15.0, right: 15.0),
                child: Text(
                  'Previous Project',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff00cfff)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
          child: Text(
            'PROJECT PROGRESS PHOTO\nप्रोजेक्ट की कार्य प्रगति की तस्वीरें',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.black54),
          ),
        ),
        CarouselSlider.builder(
          itemCount: description.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 2.5),
            child: Image.network(description[itemIndex].image.toString()),
          ),
          options: CarouselOptions(
            // height: 250,
            aspectRatio: 2,
            viewportFraction: 0.9,
            initialPage: 0,
            // enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            // autoPlayCurve: Curves.fastOutSlowIn,
            // enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
          child: Container(
            width: double.infinity,
            color: Color(0xfff47435),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
              child: Text(
                'Know what our clients say about us !! \n जानिए क्या कहते हैं हमारे ग्राहक !!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2.5),
          child: GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 6,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(absayData.data.testimonial.length, (index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                          absayData.data.testimonial[index].thumb.toString()),
                      IconButton(
                        padding: const EdgeInsets.all(12.0),
                        icon: Image.asset("assets/images/play.png"),
                        iconSize: 10.0,
                        onPressed: () {
                          // Navigator.pushNamed(context, MyRoutes.youtubeRoute);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YoutubePlayerDemoApp(
                                  url: absayData.data.testimonial[index].src
                                      .toString(),
                                ),
                              ));

                          // MyFunctions.showToast("Put your message here");
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
