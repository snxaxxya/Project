class Classified {
  String result;

  Classified({this.result});

  Classified.fromJson(Map<String, dynamic> json) {
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    return data;
  }
}
class RequestModel {
  String image;

  RequestModel({this.image});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'Image': image.trim(),
    };

    return map;
  }
}

