import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ClassifiedAPI {
  Logger logger = Logger();

  imageAPI(var imageFile) async {
    var url = "http://9953-2403-6200-8860-30cb-f0db-8b9d-85b6-b93e.ngrok.io/api/image/";

    final response = await Dio().post(url, data: imageFile.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      // LoginResponseModel loginResponseModel =
      //     LoginResponseModel.fromJson(jsonDecode(response.body));

      // print(response.body);

      logger.e(response.data);
    } else {
      throw Exception('Failed to load data!');
    }
    return response.data;
  }
}
