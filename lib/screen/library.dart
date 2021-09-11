import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:myproject/screen/component/footer.dart';

class GalleryList extends StatefulWidget {
  const GalleryList({Key key}) : super(key: key);

  @override
  _GalleryListState createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {
  bool _pinned = true;

  List<LibraryList> listLibrary(String responseBody) {
    final lists = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return lists
        .map<LibraryList>((json) => LibraryList.fromJson(json))
        .toList();
  }

  Future<List<LibraryList>> getData(http.Client client) async {
    var url =
        "http://78bb-2405-9800-b530-4ce7-89e2-ee36-6ba4-b149.ngrok.io/api/patterns/";

    final response = await Dio().get(url);

    if (response.statusCode == 200 || response.statusCode == 400) {
      Logger logger = Logger();
      logger.e(response.data);
    } else {
      throw Exception('Failed to load data!');
    }
    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    String image =
        "http://78bb-2405-9800-b530-4ce7-89e2-ee36-6ba4-b149.ngrok.io";
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          "Library",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: FutureBuilder<List<LibraryList>>(
        future: getData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index].Pattern_Name),
                  subtitle: Text(snapshot.data[index].Pattern_Des),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(image + snapshot.data[index].Pattern_img),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      // body: Container(
      //   child: ListView.builder(
      //     itemCount: patternList.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(patternList[index].Pattern_Name),
      //         subtitle: Text(patternList[index].Pattern_Des),
      //         leading: CircleAvatar(
      //           backgroundImage: NetworkImage(patternList[index].Pattern_img),
      //         ),
      //       );
      //     },
      //   ),
      // ),
      bottomNavigationBar: BottomBar(
        selectedMenu: MenuState.list,
      ),
    );
  }
}

// class PatternAPI {
//   static Future getData() async {
//     var url = Uri.parse("http://1a6478d3541c.ngrok.io/api/patterns/");
//     final response = await http.get(url);
//     //print(utf8.decode(response.bodyBytes));

//     return utf8.decode(response.bodyBytes);
//     // return response;
//   }
// }

class LibraryList {
  int Pattern_id;
  String Pattern_Name;
  int Klin_Group;
  int Writing_Pattern;
  int Type_Pattern;
  String Pattern_img;
  String Pattern_Des;

  LibraryList(
      {this.Pattern_id,
      this.Pattern_Name,
      this.Klin_Group,
      this.Writing_Pattern,
      this.Type_Pattern,
      this.Pattern_img,
      this.Pattern_Des});

  factory LibraryList.fromJson(Map<String, dynamic> json) {
    return LibraryList(
        Pattern_id: json['Pattern_id'] as int,
        Pattern_Name: json['Pattern_Name'] as String,
        Klin_Group: json['Klin_Group'] as int,
        Writing_Pattern: json['Writing_Pattern'] as int,
        Type_Pattern: json['Type_Pattern'] as int,
        Pattern_img: json['Pattern_img'] as String,
        Pattern_Des: json['Pattern_Des'] as String);
  }
}
