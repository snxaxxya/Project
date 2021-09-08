import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myproject/screen/component/footer.dart';

class GalleryList extends StatefulWidget {
  const GalleryList({Key key}) : super(key: key);

  @override
  _GalleryListState createState() => _GalleryListState();
}

class _GalleryListState extends State<GalleryList> {
  bool _pinned = true;
  // List<LibraryList> patternList = <LibraryList>[];

  List<LibraryList> listLibrary(String responseBody) {
    final lists = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return lists
        .map<LibraryList>((json) => LibraryList.fromJson(json))
        .toList();
  }

  Future<List<LibraryList>> getData(http.Client client) async {
    var url = Uri.parse("http://108b-61-7-142-198.ngrok.io/api/patterns/");
    final response = await client.get(url);
    //var jsonData = json.decode(response.body);
    return listLibrary(utf8.decode(response.bodyBytes));
  }

  // void getPatternfromApi() async {
  //   PatternAPI.getData().then((response) {
  //     setState(() {
  //       Iterable list = json.decode(response.bodyB);
  //       patternList = list.map((model) => LibraryList.fromJson(model)).toList();
  //       //print(patternList);
  //       //patternList = response;
  //     });
  //   });
  // }

  // @override
  // Void initState() {
  //   super.initState();
  //   //getPatternfromApi();
  //   //getData();
  // }

  // Future getData() async {
  //   var url = Uri.parse("http://1a6478d3541c.ngrok.io/api/patterns/");
  //   final response = await http.get(url);

  //   // print(response.body);
  //   // final jsonresponse = json.decode(response.body);
  //   // return ChangeTypeLibrary.fromJson(jsonresponse[index]);

  //   final jsonresponse = utf8.decode(response.bodyBytes);
  //   //print(jsonresponse);
  //   if (response.statusCode == 200) {
  //     return jsonresponse;
  //   } else {
  //     throw Exception("Fail to load data");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String image = "http://108b-61-7-142-198.ngrok.io";
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
      //   child: FutureBuilder(
      //     future: getData(),
      //     builder: (BuildContext context, AsyncSnapshot snapshot) {
      //       if (snapshot.data == null) {
      //         return Container(
      //           child: Center(
      //             child: Text("Loading..."),
      //           ),
      //         );
      //       }
      //       return ListView.builder(
      //           itemCount: snapshot.data.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return ListTile(
      //               title: Text(snapshot.data[index].Pattern_Name),
      //             );
      //           });
      //     },
      //   ),
      // ),
      // body: SingleChildScrollView(
      //   child: FutureBuilder(
      //     future: getData(),
      //     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         //ถ้าดึงข้อมูลครบ
      //         return new Text(
      //           snapshot.data.Pattern_Name,
      //           style: TextStyle(fontSize: 18),
      //         );
      //       } else if (snapshot.hasError) {
      //         return new Text("Error ${snapshot.error}");
      //       }
      //       return LinearProgressIndicator();
      //     },
      //   ),
      // ),

      // body: SingleChildScrollView(
      //   child: FutureBuilder(
      //     future: PatternAPI.getData(),
      //     builder: (context, snapshot) {
      //       //var i = patternList.length;
      //       if (snapshot.hasData) {
      //         return Text(snapshot.data.toString() + "\n");
      //         // for (var i = 0; i < patternList.length; i++) {
      //         //   return ListTile(
      //         //     title: Text(patternList.elementAt(i).patternName),
      //         //     subtitle: Text(patternList.elementAt(i).patternDes),
      //         //     leading: CircleAvatar(
      //         //         //backgroundImage: NetworkImage(snapshot.data.patternImg),
      //         //         ),
      //         //   );
      //         // }
      //       } else if (snapshot.hasError) {
      //         return Text("Error ${snapshot.error}");
      //       }
      //       return LinearProgressIndicator();
      //     },
      //   ),
      // ),
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

  // LibraryList.fromJson(Map json)
  //     : Pattern_id = json['Pattern_id'],
  //       Pattern_Name = json['Pattern_Name'],
  //       Klin_Group = json['Klin_Group'],
  //       Writing_Pattern = json['Writing_Pattern'],
  //       Type_Pattern = json['Type_Pattern'],
  //       Pattern_img = json['Pattern_img'],
  //       Pattern_Des = json['Pattern_Des'];
  // Map toJson() {
  //   return {
  //     'Pattern_id': Pattern_id,
  //     'Pattern_Name': Pattern_Name,
  //     'Klin_Group': Klin_Group,
  //     'Writing_Pattern': Writing_Pattern,
  //     'Type_Pattern': Type_Pattern,
  //     'Pattern_img': Pattern_img,
  //     'Pattern_Des': Pattern_Des
  //   };
  // }
}

// class PhotosList {
//   final List<LibraryList> photos;

//   PhotosList({
//     this.photos,
//   });

//   factory PhotosList.fromJson(List<dynamic> parsedJson) {
//     List<LibraryList> photos = new List<LibraryList>();
//     photos = parsedJson.map((i) => LibraryList.fromjson(i)).toList();

//     return new PhotosList(photos: photos);
//   }
// }
