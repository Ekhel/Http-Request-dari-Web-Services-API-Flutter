import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../main.dart';

class Detail extends StatefulWidget {
  //final String skpd;
  //Detail({Key key, this.skpd}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  static String skpd;
  Map data;
  List dataDetail;

  String url = 'http://sickat.jayapurakab.go.id/api/get_detail_realisasi_pd/2';
  Future getData() async {
    http.Response response =
        await http.get('http://sickat.jayapurakab.go.id/api/get_detail_realisasi_pd/2');
    data = json.decode(response.body);
    setState(() {
      dataDetail = data["skpd"];
    });
    debugPrint(dataDetail.toString());
  }


  Widget imageCarousel = new Container(
      height: 150.0,
      child: Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.cover,
        autoplay: true,
        dotSize: 5.0,
        indicatorBgPadding: 9.0,
        images: [new AssetImage("assets/slider/bg1.png")],
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ));

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Detail PD"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage()
                  )
                );
              }
            )
          ],
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: dataDetail == null ? 0 : dataDetail.length,
          itemBuilder: (BuildContext context, int index){
            imageCarousel;
            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                child: ListTile(
                  title: Text("Dinas Kesehatan".toUpperCase()),
                  subtitle: Text("11.200.000"),
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
