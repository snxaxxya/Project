import 'package:myproject/provider/profile-provider.dart';
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
    // return Scaffold(
    //   backgroundColor: Colors.blueGrey,
    //   appBar: AppBar(
    //     title: Text(
    //       "ข้อมูลส่วนตัว",
    //       style: TextStyle(color: Colors.black),
    //     ),
    //     backgroundColor: Colors.white,
    //     iconTheme: IconThemeData(color: Colors.black),
    //   ),
    //   body: SingleChildScrollView(
    //       child: Column(
    //     children: [
    //       SizedBox(
    //         height: 30,
    //       ),
    //       Container(
    //         child: Text(
    //           "ข้อมูลส่วนตัว",
    //           style: TextStyle(fontSize: 25, color: Colors.white),
    //         ),
    //       ),
    //       Container(
    //         margin: EdgeInsets.all(25),
    //         padding: EdgeInsets.all(25),
    //         width: double.infinity,
    //         alignment: Alignment.center,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.all(
    //             Radius.circular(10),
    //           ),
    //           border: Border.all(color: Colors.white),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.black12,
    //               offset: Offset(2, 2),
    //               spreadRadius: 2,
    //               blurRadius: 1,
    //             ),
    //           ],
    //         ),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               "ชื่อ แมว เมี๊ยว",
    //               style: TextStyle(fontSize: 20, color: Colors.black),
    //             ),
    //             Text(
    //               "เบอร์ 191-1911-191",
    //               style: TextStyle(fontSize: 20, color: Colors.black),
    //             ),
    //             Text(
    //               "อีเมล catcat@gmail.com",
    //               style: TextStyle(fontSize: 20, color: Colors.black),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //           // margin: EdgeInsets.symmetric(vertical: 10),
    //           // width: size.width * 0.8,
    //           child: TextButton(
    //         style: flatButtonStyle,
    //         onPressed: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) {
    //             return LoginScreen();
    //           }));
    //         },
    //         child: Text(
    //           'Logout',
    //           //style: TextStyle(color: Colors.white),
    //         ),
    //       )),
    //     ],
    //   )),
    //   bottomNavigationBar: BottomBar(
    //     selectedMenu: MenuState.profile,
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        // elevation: 0,
        //actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: SafeArea(
        child: Column(
          children: [
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
            Container(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  style: flatButtonStyle,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: Text(
                    'ออกจากระบบ',
                    //style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
