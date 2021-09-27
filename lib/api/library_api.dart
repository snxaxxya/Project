//import 'dart:convert';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:myproject/model/library_model.dart';

// List<LibraryList> listLibrary(String responseBody) {
//   final lists = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   return lists
//       .map<LibraryList>((json) => LibraryList.fromJson(json))
//       .toList();
// }

// Future<List<LibraryList>> getData(http.Client client) async {
//   var url = "http://031e-61-7-142-197.ngrok.io/api/patterns/";
//   final response = await Dio().get(url);
//   if (response.statusCode == 200 || response.statusCode == 400) {
//     Logger logger = Logger();
//     logger.e(response.data);
//   } else {
//     throw Exception('Failed to load data!');
//   }
//   return listLibrary(response.data);
// }

class LibraryAPI {
  // Future<List<LibraryList>> listLibrary(String responseBody) async {
  //   final lists = await jsonDecode(responseBody).cast<Map<String, dynamic>>();
  //   return lists
  //       .map<LibraryList>((json) => LibraryList.fromJson(json))
  //       .toList();
  // }

  Logger logger = Logger();
  Future getData() async {
    var url =
        "http://9953-2403-6200-8860-30cb-f0db-8b9d-85b6-b93e.ngrok.io/api/patterns/";
    final response = await Dio().get(url);

    List<LibraryList> _res;

    if (response.statusCode == 200 || response.statusCode == 400) {
      Logger logger = Logger();
      logger.e(response.data);

      _res = response.data;

    } else {
      throw Exception('Failed to load data!');
    }
    return _res;
  }

  Future searchData(SearchModel requestModel) async {
    logger.e(requestModel.name);
    var search =
        "http://9953-2403-6200-8860-30cb-f0db-8b9d-85b6-b93e.ngrok.io/api/patterns/search/";
    logger.e(search);
    final response = await Dio().post(search, data: requestModel.toJson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      logger.e(response.data);
    } else {
      throw Exception('Failed to load data!');
    }
    return response.data;
  }
}
