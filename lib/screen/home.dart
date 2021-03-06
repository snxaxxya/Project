import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myproject/provider/profile-provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'component/footer.dart';
import 'noti.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String role = "";

  @override
  void initState() {
    fechData();
    super.initState();
  }

  Icon check() {
    if (role == 'ACL_LEVEL_2' || role == 'ACL_LEVEL_3') {
      return Icon(Icons.notifications);
    } else if (role == 'ACL_LEVEL_1') {
      return Icon(Icons.list);
    } else {
      return Icon(null);
    }
  }

  fechData() {
    role = Provider.of<ProfileProvider>(context, listen: false).statusName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
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
                            return NotiScreen();
                          }));
                        },
                        //icon: (x == 5) ? Icon(Icons.notifications) : Icon(Icons.list)
                        icon: check(),
                        //icon: Icon(Icons.notifications),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                constraints: BoxConstraints.expand(height: 200),
                child: imageSlider(context),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(173, 138, 133, 1),
                    borderRadius: BorderRadius.circular(25)),
                child: Text.rich(TextSpan(
                    style: TextStyle(color: Color.fromRGBO(72, 50, 46, 1)),
                    children: [
                      TextSpan(
                          text: "???????????????????????????????????????????????????????????????????????????????????????????????????",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ))
                    ])),
              ),
              // SizedBox(height: 5,),
              // Container(
              //   constraints: BoxConstraints.expand(height: 200),
              //   child: imageSlider(context),
              // )
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}

Swiper imageSlider(context) {
  return new Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return new Image.asset(
        "assets/images/cover.jpg",
        fit: BoxFit.fitHeight,
      );
    },
    itemCount: 10,
    viewportFraction: 0.8,
    scale: 0.9,
  );
}
