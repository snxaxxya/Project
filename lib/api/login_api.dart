import 'package:dio/dio.dart';
import '../model/login_model.dart';
import 'package:logger/logger.dart';

class APIService {
  Logger logger = Logger();

  login(LoginRequestModel requestModel) async {
    logger.e(requestModel.password);
    logger.e(requestModel.username);
    var url = "http://9953-2403-6200-8860-30cb-f0db-8b9d-85b6-b93e.ngrok.io/api/login/";

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
