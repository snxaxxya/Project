import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myproject/provider/profile-provider.dart';
import 'package:provider/provider.dart';
//import 'package:image_picker/image_picker.dart';
import 'component/footer.dart';
import 'login.dart';
import 'noti.dart';

class sendForm extends StatefulWidget {
  const sendForm({Key key}) : super(key: key);

  @override
  _sendFormState createState() => _sendFormState();
}

class _sendFormState extends State<sendForm> {

  String email;
  String telephone;
  String firstName;
  String lastName;
  String statusName;

  @override
  void initState() {
    fetchScreen();
    super.initState();
  }

  fetchScreen() {
    email = Provider.of<ProfileProvider>(context, listen: false).email;
    telephone = Provider.of<ProfileProvider>(context, listen: false).telephone;
    firstName = Provider.of<ProfileProvider>(context, listen: false).firstName;
    lastName = Provider.of<ProfileProvider>(context, listen: false).lastName;
    statusName =
        Provider.of<ProfileProvider>(context, listen: false).statusName;
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.black,
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          "ส่งรายงาน",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: email != null
      ? SingleChildScrollView(
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
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          //onSaved: (input) => members.username = input,
                          decoration: new InputDecoration(
                              hintText: "เลือกภาพ",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown)),
                              // prefixIcon: Icon(
                              //   Icons.image,
                              //   color: Colors.brown,
                              // ),
                              prefixIcon: IconButton(
                                icon: Icon(Icons.add_a_photo),
                                color: Colors.brown,
                                onPressed: () {},
                              )),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.streetAddress,
                          // onSaved: (input) => members.password = input,
                          // obscureText: hidePassword,
                          decoration: new InputDecoration(
                              hintText: "สถานที่พบ",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown)),
                              // prefixIcon: Icon(
                              //   Icons.home,
                              //   color: Colors.brown,
                              // ),
                              prefixIcon: IconButton(
                                icon: Icon(Icons.location_on),
                                color: Colors.brown,
                                onPressed: () {},
                              )),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.datetime,
                          //onSaved: (input) => members.firstname = input,
                          decoration: new InputDecoration(
                            hintText: "เวลาที่พบ",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextButton(
                          style: flatButtonStyle,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NotiScreen();
                            }));
                          },
                          child: Text(
                            "ส่ง",
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
      )
      : Container(
        alignment: Alignment.center,
              child: TextButton(
                style: flatButtonStyle,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                child: Text(
                  'เข้าสู่ระบบ',
                  //style: TextStyle(color: Colors.white),
                ),
              )
      ),
      bottomNavigationBar: BottomBar(
        selectedMenu: MenuState.sendform,
      ),
    );
  }
}
