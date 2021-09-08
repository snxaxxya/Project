import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:myproject/provider/profile-provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../model/login_model.dart';
import 'package:logger/logger.dart';

class APIService {
  Logger logger = Logger();

  login(LoginRequestModel requestModel) async {
    logger.e(requestModel.password);
    logger.e(requestModel.username);
    var url = "http://108b-61-7-142-198.ngrok.io/api/login/";

    final response = await Dio().post(url, data: requestModel.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      // LoginResponseModel loginResponseModel =
      //     LoginResponseModel.fromJson(jsonDecode(response.body));

      // print(response.body);

    } else {
      throw Exception('Failed to load data!');
    }
    return response.data;
  }
}
