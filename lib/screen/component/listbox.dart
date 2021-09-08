import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ListBox extends StatelessWidget {
  Image img; //picture kaa
  String title; //type kaa
  ListBox(this.img, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      height: 120,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          img,
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Pattaya', fontSize: 25, color: Colors.black),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}
