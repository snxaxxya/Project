import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myproject/screen/acceptnew.dart';

class NotiScreen extends StatefulWidget {
  const NotiScreen({Key key}) : super(key: key);

  @override
  _NotiScreenState createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          "การแจ้งเตือน",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("assets/images/food-donation.png"),
              SizedBox(
                width: 20,
              ),
              Text("ได้รับรายงานใหม่"),
              Expanded(
                // child: Text(
                //   "ได้รับรายงานใหม่      ",
                //   textAlign: TextAlign.right,
                // ),
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AcceptScreen();
                      }));
                    },
                    icon: Icon(Icons.download),
                    label: Text("Load File")),
              ),
              // TextButton.icon(
              //     onPressed: () {},
              //     icon: Icon(Icons.download),
              //     label: Text("Load File"))
            ],
          ),
        ),
      ),
    );
  }
}
