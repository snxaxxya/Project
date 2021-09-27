import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:myproject/model/login_model.dart';

class ProfileProvider extends ChangeNotifier {
  Logger logger = Logger();
  String username;
  String password;
  String firstName;
  String lastName;
  String telephone;
  String email;
  String dateJoined;
  String statusID;
  String statusName;
  LoginResponseModel loginResponseModel = LoginResponseModel();

  saveProfile(response) async {
    loginResponseModel = LoginResponseModel.fromJson(response);
    this.username = loginResponseModel.username;
    this.password = loginResponseModel.password;
    this.firstName = loginResponseModel.firstname;
    this.lastName = loginResponseModel.lastname;
    this.telephone = loginResponseModel.telephone;
    this.email = loginResponseModel.email;
    this.dateJoined = loginResponseModel.dateJoined;
    this.statusID = loginResponseModel.status.statusID;
    this.statusName = loginResponseModel.status.statusName;
  }
}
