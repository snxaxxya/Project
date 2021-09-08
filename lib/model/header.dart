
import 'package:myproject/screen/noti.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NotiScreen();
                }));
              },
              icon: Icon(Icons.notifications),
            ),
            
          ],
        ),
      ),
    );
  }
}
