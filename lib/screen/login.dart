import 'package:logger/logger.dart';
import 'package:myproject/api/login_api.dart';
import 'package:myproject/main.dart';
import 'package:myproject/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:myproject/provider/login-provider.dart';
import 'package:myproject/provider/profile-provider.dart';
import 'package:myproject/screen/register.dart';
import 'package:provider/provider.dart';
import 'component/account_check.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Logger logger = Logger();
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  LoginRequestModel loginRequestModel;
  LoginResponseModel loginResponseModel;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel(username: '', password: '');
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Align(),
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
                        SizedBox(height: 25),
                        Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(fontSize: 28),
                        ),
                        SizedBox(height: 20),
                        new TextFormField(
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              loginRequestModel.username = input,
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
                              loginRequestModel.password = input,
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
                        SizedBox(height: 30),
                        TextButton(
                          style: flatButtonStyle,
                          onPressed: () async {
                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;
                              });
                              APIService apiService = new APIService();
                              var response =
                                  await apiService.login(loginRequestModel);
                              if (response != null) {
                                setState(() {
                                  isApiCallProcess = false;
                                });
                                Provider.of<ProfileProvider>(context,
                                        listen: false)
                                    .saveProfile(response);

                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MyHomePage();
                                }));
                              } else {
                                print("Invalid");
                              }
                              logger.e(response);
                            }
                          },
                          child: Text(
                            "เข้าสู่ระบบ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 15),
                        AccountCheck(
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RegisterScreen();
                            }));
                          },
                        )
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
