import 'package:myproject/main.dart';
import 'package:myproject/screen/form.dart';
import 'package:myproject/screen/home.dart';
import 'package:myproject/screen/library.dart';
import 'package:myproject/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

enum MenuState { home, list, classification, sendform, profile }

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
    this.selectedMenu,
  }) : super(key: key);
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return GalleryList();
                  }));
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyHomePage();
                  }));
                },
                icon: Icon(Icons.image_search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return sendForm();
                  }));
                },
                icon: Icon(Icons.file_upload),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Profile();
                  }));
                },
                icon: Icon(Icons.person),
              ),
            ],
          )),
    );
  }
}
