// import 'dart:convert';
// import 'dart:developer';
// import 'dart:ffi';
//import 'dart:convert';

//import 'package:dio/dio.dart';
//import 'dart:html';
import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:myproject/api/library_api.dart';
import 'package:myproject/model/library_model.dart';
import 'package:myproject/provider/search-provider.dart';
// import 'package:logger/logger.dart';
// import 'package:myproject/api/library_api.dart';
// import 'package:myproject/api/login_api.dart';
// import 'package:myproject/model/library_model.dart';
import 'package:myproject/screen/component/footer.dart';
import 'package:myproject/screen/search.dart';
import 'package:provider/provider.dart';

class GalleryList extends StatefulWidget {
  const GalleryList({Key key}) : super(key: key);

  @override
  _GalleryListState createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {
  Logger logger = Logger();
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  SearchModel searchModel;
  LibraryList libraryList;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<LibraryList> a;

  @override
  void initstate() {
    super.initState();
    a = LibraryAPI().getData() as List<LibraryList>;
    //LibraryAPI().getData();
    //searchModel = new SearchModel(name: '');
  }

  ButtonStyle flatButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    backgroundColor: Color(0xFF795548),
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(29)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text(
          "Library",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: (LibraryAPI().getData() != null)
          ? Container(
              child: Column(
                children: <Widget>[
                  ListView.builder(
                    itemCount: a.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(a[index].patternName),
                        subtitle: Text(a[index].patternDes),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "http://9953-2403-6200-8860-30cb-f0db-8b9d-85b6-b93e.ngrok.io" +
                                  a[index].patternImg.last.img),
                        ),
                      );
                    },
                  )
                  // FutureBuilder<List<LibraryList>>(
                  //   initialData: List(),
                  //   future: LibraryAPI().getData(),
                  //   builder: (context, snapshot) {
                  //     print(snapshot.data);
                  //     if (snapshot.hasError) {
                  //       return const Center(
                  //         child: Text('An error has occurred!'),
                  //       );
                  //     } else if (snapshot.hasData) {
                  //       final List<LibraryList> contacts = snapshot.data;
                  //       return ListView.builder(
                  //         itemCount: snapshot.data.length,
                  //         itemBuilder: (context, index) {
                  //           return ListTile(
                  //             title: Text(contacts[index].patternName),
                  //             subtitle: Text(contacts[index].patternDes),
                  //             // leading: CircleAvatar(
                  //             //   backgroundImage: NetworkImage(
                  //             //       "http://a65a-61-7-142-198.ngrok.io"+ snapshot.data[index].patternImg.last.img),
                  //             // ),
                  //           );
                  //         },
                  //       );
                  //     } else {
                  //       return const Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }
                  //   },
                  // ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      bottomNavigationBar: BottomBar(
        selectedMenu: MenuState.list,
      ),
    );
  }
}

// class LibraryList {
//   int Pattern_id;
//   String Pattern_Name;
//   int Klin_Group;
//   int Writing_Pattern;
//   int Type_Pattern;
//   String Pattern_img;
//   String Pattern_Des;

//   LibraryList(
//       {this.Pattern_id,
//       this.Pattern_Name,
//       this.Klin_Group,
//       this.Writing_Pattern,
//       this.Type_Pattern,
//       this.Pattern_img,
//       this.Pattern_Des});

//   factory LibraryList.fromJson(Map<String, dynamic> json) {
//     return LibraryList(
//         Pattern_id: json['Pattern_id'] as int,
//         Pattern_Name: json['Pattern_Name'] as String,
//         Klin_Group: json['Klin_Group'] as int,
//         Writing_Pattern: json['Writing_Pattern'] as int,
//         Type_Pattern: json['Type_Pattern'] as int,
//         Pattern_img: json['Pattern_img'] as String,
//         Pattern_Des: json['Pattern_Des'] as String);
//   }
// }
