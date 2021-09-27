import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:myproject/model/library_model.dart';

class SearchProvider extends ChangeNotifier {
  Logger logger = Logger();
  String patternName;
  String klinGroup;
  String patternImg;
  String patternDes;
  LibraryList searchResponseModel = LibraryList();

  saveProfile(response) async {
    searchResponseModel = LibraryList.fromJson(response);
    this.patternName = searchResponseModel.patternName;
    this.klinGroup = searchResponseModel.klinGroup.klinGroupName;
    this.patternImg = searchResponseModel.patternImg.last.img;
    this.patternDes = searchResponseModel.patternDes;
  }
}