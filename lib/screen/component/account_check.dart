import 'package:flutter/cupertino.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "ยังไม่ลงทะเบียน ? " : "มีบัญชีอยู่แล้ว ? ",
          //style: TextStyle(color: kPrimaryColor, fontFamily: 'Pattaya'),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "สมัครตอนนี้" : "เข้าสู่ระบบ",
            style: TextStyle(
                //color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pattaya'),
          ),
        )
      ],
    );
  }
}
