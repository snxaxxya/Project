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
