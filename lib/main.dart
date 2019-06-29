import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data;
  List userData;

  Future getData() async {
    http.Response response =
        await http.get("http://sickat.jayapurakab.go.id/api/get_realisasi_pd");
    data = json.decode(response.body);
    setState(() {
      userData = data["realisasi"];
    });
    debugPrint(userData.toString());
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROGRES REALISASI", style: TextStyle(color: Colors.white, fontSize: 18.0)),
        backgroundColor: Colors.purple[300],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("SICKAT",
                  style: TextStyle(fontSize: 20.0, color: Colors.black)),
              accountEmail: Text("Mobile Version (1.1)"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage("assets/KabJayapura.png"),
                    child: Icon(Icons.person, size: 60.0, color: Colors.green)),
              ),
              decoration: BoxDecoration(color: Colors.green[200]),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title:
                    Text("Beranda", style: TextStyle(color: Colors.green[800])),
                leading: Icon(
                  Icons.store,
                  color: Colors.green[600],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Realisasi",
                    style: TextStyle(color: Colors.green[800])),
                leading: Icon(
                  Icons.access_alarm,
                  color: Colors.green[600],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Triwulan",
                    style: TextStyle(color: Colors.green[800])),
                leading: Icon(
                  Icons.bookmark,
                  color: Colors.green[600],
                ),
              ),
            ),
            Divider(
              color: Colors.green,
              height: 4.0,
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title:
                    Text("Bantuan", style: TextStyle(color: Colors.green[800])),
                leading: Icon(
                  Icons.help,
                  color: Colors.green[600],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value){
                  
                },
                decoration: InputDecoration(
                  labelText: "Cari",
                  hintText: "Cari",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                ),
              ),
              
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: userData == null ? 0 : userData.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 24.0,
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: new AssetImage("assets/grafik.png"),
                          ),
                          title: Text("${userData[index]['ALIAS']}".toUpperCase()),
                          subtitle: Text("PF : ${userData[index]['PF']}% , PK : ${userData[index]['PK']}%"),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: (){

                          },
                        ),
                      ),
                    );
                  },
                )
              )
          ],
        ),
      )
    );
  }
}
