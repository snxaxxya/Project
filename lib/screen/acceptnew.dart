import 'package:flutter/material.dart';
import 'package:myproject/screen/home.dart';

class AcceptScreen extends StatefulWidget {
  const AcceptScreen({Key key}) : super(key: key);

  @override
  _AcceptScreenState createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: Color(0xFF795548),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          "อนุมัติลวดลาย",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // body: SingleChildScrollView(
      //   child: Container(
      //     margin: EdgeInsets.all(25),
      //     padding: EdgeInsets.all(25),
      //     width: double.infinity,
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(10),
      //       ),
      //       border: Border.all(color: Colors.white),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black12,
      //           offset: Offset(2, 2),
      //           spreadRadius: 2,
      //           blurRadius: 1,
      //         ),
      //       ],
      //     ),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         SizedBox(
      //           height: size.height * 0.03,
      //         ),
      //         Image.asset(
      //           "assets/images/image.png",
      //           height: 200,
      //         ),
      //         SizedBox(
      //           height: size.height * 0.03,
      //         ),
      //         SizedBox(
      //           height: size.height * 0.03,
      //         ),
      //         Text(
      //           "กำหนดชื่อลวดลาย :                                           ",
      //           // style: TextStyle(
      //           //     fontFamily: 'Pattaya', fontSize: 25, color: kPrimaryColor),
      //         ),
      //         Text(
      //           "ประเภทโบราณวัตถุ :                                          ",
      //           // style: TextStyle(
      //           //     fontFamily: 'Pattaya', fontSize: 20, color: kPrimaryColor),
      //         ),
      //         Text(
      //           "แหล่งเตาเผา :                                                     ",
      //           // style: TextStyle(
      //           //     fontFamily: 'Pattaya', fontSize: 20, color: kPrimaryColor),
      //         ),
      //         Text(
      //           "รายละเอียด :                                                       ",
      //           // style: TextStyle(
      //           //     fontFamily: 'Pattaya', fontSize: 20, color: kPrimaryColor),
      //         ),
      //         SizedBox(
      //           height: size.height * 0.03,
      //         ),
      //         Container(
      //             alignment: Alignment.bottomCenter,
      //             child: TextButton(
      //               style: flatButtonStyle,
      //               onPressed: () {
      //                 Navigator.push(context,
      //                     MaterialPageRoute(builder: (context) {
      //                   return HomeScreen();
      //                 }));
      //               },
      //               child: Text(
      //                 'อนุมัติ',
      //                 //style: TextStyle(color: Colors.white),
      //               ),
      //             )),
      //       ],
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
                Container(
                  // width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    //key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/image.png",
                          height: 200,
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          //onSaved: (input) => members.username = input,
                          decoration: new InputDecoration(
                            hintText: "กำหนดชื่อลวดลาย",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            // prefixIcon: Icon(
                            //   Icons.image,
                            //   color: Colors.brown,
                            // ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.text,
                          // onSaved: (input) => members.password = input,
                          // obscureText: hidePassword,
                          decoration: new InputDecoration(
                            hintText: "ประเภทโบราณวัตถุ",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            // prefixIcon: Icon(
                            //   Icons.home,
                            //   color: Colors.brown,
                            // ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.text,
                          //onSaved: (input) => members.firstname = input,
                          decoration: new InputDecoration(
                            hintText: "แหล่งเตาเผา",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            // prefixIcon: Icon(
                            //   Icons.calendar_today,
                            //   color: Colors.brown,
                            // ),
                          ),
                        ),
                        SizedBox(height: 30),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.text,
                          //onSaved: (input) => members.firstname = input,
                          decoration: new InputDecoration(
                            hintText: "รายละเอียดเพิ่มเติม",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            // prefixIcon: Icon(
                            //   Icons.calendar_today,
                            //   color: Colors.brown,
                            // ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextButton(
                          style: flatButtonStyle,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return HomeScreen();
                            }));
                          },
                          child: Text(
                            "อนุมัติ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
