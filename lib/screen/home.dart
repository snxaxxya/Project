import 'package:flutter/material.dart';
import 'package:myproject/model/header.dart';

import 'component/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Header(),
              Container(
                child: Image.asset("assets/images/cover.jpg"),
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
                          text: "จำแนกลวดลายก้นเเครื่องถ้วยสุโขทัย",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ))
                    ])),
              ),
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
