import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myproject/model/regis_model.dart';

class APIRegis {
  Future<RegisResponseModel> regis(RegisRequestModel requestModel) async {
    var url = Uri.parse(
        "http://78bb-2405-9800-b530-4ce7-89e2-ee36-6ba4-b149.ngrok.io/api/members/");

    final response = await http.post(url, body: requestModel.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      return RegisResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
