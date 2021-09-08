import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

class StatusProvider extends ChangeNotifier {
  Logger logger = Logger();
  bool status = false;

  changeStatus(status) async {
    this.status = status;
  }
}
