import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'dart:convert';

import 'package:myproject/model/regis_model.dart';

class EditProfileAPI {
  Logger logger = Logger();
  Future<RegisResponseModel> regis(RegisRequestModel requestModel) async {
    logger.e(requestModel.firstname);
    logger.e(requestModel.lastname);
    logger.e(requestModel.email);
    var url = Uri.parse("http://9953-2403-6200-8860-30cb-f0db-8b9d-85b6-b93e.ngrok.io/api/members/");

    final response = await http.put(url, body: requestModel.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}