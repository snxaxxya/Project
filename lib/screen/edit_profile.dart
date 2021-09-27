import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:myproject/api/editprofile_api.dart';
import 'package:myproject/provider/profile-provider.dart';
import 'package:myproject/screen/profile.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String email;
  String telephone;
  String firstName;
  String lastName;

  Logger logger = Logger();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  

  @override
  void initState() {
    fetchScreen();
    //editRequestModel = new EditRequestModel(name: '',);
    super.initState();
  }

  fetchScreen() {
    email = Provider.of<ProfileProvider>(context, listen: false).email;
    telephone = Provider.of<ProfileProvider>(context, listen: false).telephone;
    firstName = Provider.of<ProfileProvider>(context, listen: false).firstName;
    lastName = Provider.of<ProfileProvider>(context, listen: false).lastName;
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
          "",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15,),
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "แก้ไขข้อมูลส่วนตัว",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey,
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.text,
                          // onSaved: (input) =>
                          //     regisRequestModel.firstname = input,
                          decoration: new InputDecoration(
                            hintText: "$firstName",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            prefixIcon: Icon(
                              Icons.person_add,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.text,
                          // onSaved: (input) =>
                          //     regisRequestModel.lastname = input,
                          decoration: new InputDecoration(
                            hintText: "$lastName",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            prefixIcon: Icon(
                              Icons.person_add,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.text,
                          // onSaved: (input) =>
                          //     regisRequestModel.telephone = input,
                          decoration: new InputDecoration(
                            hintText: "$telephone",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.text,
                          // onSaved: (input) => regisRequestModel.email = input,
                          decoration: new InputDecoration(
                            hintText: "$email",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextButton(
                          style: flatButtonStyle,
                          onPressed: () async {
                            // if (validateAndSave()) {
                            //   setState(() {
                            //     isApiCallProcess = true;
                            //   });
                            //   EditProfileAPI apiService = new EditProfileAPI();
                            //   var response =
                            //       await apiService.regis(editRequestModel);
                            //   if (response != null) {
                            //     logger.e(response);
                            //     setState(() {
                            //       isApiCallProcess = false;
                            //     });

                            //     Navigator.push(context,
                            //         MaterialPageRoute(builder: (context) {
                            //       return Profile();
                            //     }));
                            //   } else {
                            //     print("can not update");
                            //   }
                            //}
                          },
                          child: Text(
                            "บันทึก",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
