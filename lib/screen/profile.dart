import 'dart:developer';

import 'package:logger/logger.dart';
import 'package:myproject/api/login_api.dart';
import 'package:myproject/main.dart';
import 'package:myproject/provider/profile-provider.dart';
import 'package:myproject/screen/edit_profile.dart';
import 'package:myproject/screen/home.dart';
import 'package:myproject/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'component/footer.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
      body: email != null
          ? SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFDADADA).withOpacity(0.15),
                        ),
                      ],
                    ),
                    child: SafeArea(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return EditProfile();
                              }));
                            },
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/cover.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      child: Container(
                        alignment: Alignment(0.0, 2.5),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/girl.png"),
                          radius: 60.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "$firstName $lastName",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Email : $email",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tel. $telephone",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Status : $statusName",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        style: flatButtonStyle,
                        onPressed: () {

                          Logger logger = new Logger();
                          logger.e("Clear");
                          
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MyApp();
                          }));
                        },
                        child: Text(
                          'ออกจากระบบ',
                          //style: TextStyle(color: Colors.white),
                        ),
                      )),
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
              )),
      bottomNavigationBar: BottomBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
