import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../main.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Widget imageCarousel = new Container(
      height: 200.0,
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
        body: ListView(
          children: <Widget>[
            SizedBox(height: 5.0),
            imageCarousel,
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 8.0,
              ),
              child: Text(
                'Detail Realisasi DINKES',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.purpleAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
