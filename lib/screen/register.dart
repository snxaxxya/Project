import 'package:flutter/material.dart';
import 'package:myproject/api/register_api.dart';
import 'package:myproject/model/regis_model.dart';
import 'package:myproject/screen/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  RegisRequestModel regisRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool hidePassword = true;
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    regisRequestModel = new RegisRequestModel(
        username: '',
        password: '',
        firstname: '',
        lastname: '',
        telephone: '',
        email: '');
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      backgroundColor: Color(0xFF795548),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
    );
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
            Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "ลงทะเบียน",
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
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              regisRequestModel.username = input,
                          decoration: new InputDecoration(
                            hintText: "ชื่อผู้ใช้",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.brown,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              regisRequestModel.password = input,
                          obscureText: hidePassword,
                          decoration: new InputDecoration(
                              hintText: "รหัสผ่าน",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.brown,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_off,
                                color: Colors.brown.withOpacity(0.4),
                              )),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          style: TextStyle(color: Colors.brown),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              regisRequestModel.firstname = input,
                          decoration: new InputDecoration(
                            hintText: "ชื่อ",
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
                          onSaved: (input) =>
                              regisRequestModel.lastname = input,
                          decoration: new InputDecoration(
                            hintText: "นามสกุล",
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
                          onSaved: (input) =>
                              regisRequestModel.telephone = input,
                          decoration: new InputDecoration(
                            hintText: "เบอร์",
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
                          onSaved: (input) => regisRequestModel.email = input,
                          // validator: (input) => !input.contains('@')
                          //     ? "Email Id should be valid"
                          //     : null,
                          decoration: new InputDecoration(
                            hintText: "Email",
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
                          onPressed: () {
                            if (validateAndSave()) {
                              //print(loginRequestModel.toJson());
                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIRegis apiService = new APIRegis();
                              apiService.regis(regisRequestModel).then((value) {
                                if (value != null) {
                                  print(regisRequestModel.toJson());
                                  setState(() {
                                    isApiCallProcess = false;
                                  });
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginScreen();
                                  }));
                                } else {
                                  print(Error());
                                }
                              });
                            }
                          },
                          child: Text(
                            "ลงทะเบียน",
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
