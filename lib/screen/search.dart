import 'package:flutter/material.dart';
import 'package:myproject/provider/search-provider.dart';
import 'package:provider/provider.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({Key key}) : super(key: key);

  @override
  _searchScreenState createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  String name;
  String group;
  String des;
  String img;

  @override
  void initState() {
    fetchScreen();
    super.initState();
  }

  fetchScreen() {
    name = Provider.of<SearchProvider>(context, listen: false).patternName;
    group
     = Provider.of<SearchProvider>(context, listen: false).klinGroup;
    des = Provider.of<SearchProvider>(context, listen: false).patternDes;
    img = Provider.of<SearchProvider>(context, listen: false).patternImg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          "$name",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox( height: 10,),
            Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(2, 2),
                      spreadRadius: 2,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Image(image: NetworkImage("http://a65a-61-7-142-198.ngrok.io$img"),)
            ),
            SizedBox(
                    height: 10,
                  ),
            Text("ชื่อลวดลาย $name"),
            SizedBox(
                    height: 10,
                  ),
            Text("กลุ่มเตาเผา $group"),
            SizedBox(
                    height: 10,
                  ),
            Text("รายละเอียด $des"),
        ],),
      ),
    );
  }
}
