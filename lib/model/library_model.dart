class LibraryList {
  int patternId;
  String patternName;
  KlinGroup klinGroup;
  WritingPattern writingPattern;
  TypePattern typePattern;
  String patternDes;
  List<PatternImg> patternImg;

  LibraryList(
      {this.patternId,
      this.patternName,
      this.klinGroup,
      this.writingPattern,
      this.typePattern,
      this.patternDes,
      this.patternImg});

  LibraryList.fromJson(Map<String, dynamic> json) {
    patternId = json['Pattern_id'];
    patternName = json['Pattern_Name'];
    klinGroup = json['Klin_Group'] != null
        ? new KlinGroup.fromJson(json['Klin_Group'])
        : null;
    writingPattern = json['Writing_Pattern'] != null
        ? new WritingPattern.fromJson(json['Writing_Pattern'])
        : null;
    typePattern = json['Type_Pattern'] != null
        ? new TypePattern.fromJson(json['Type_Pattern'])
        : null;
    patternDes = json['Pattern_Des'];
    if (json['pattern_img'] != null) {
      patternImg = new List<PatternImg>();
      json['pattern_img'].forEach((v) {
        patternImg.add(new PatternImg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Pattern_id'] = this.patternId;
    data['Pattern_Name'] = this.patternName;
    if (this.klinGroup != null) {
      data['Klin_Group'] = this.klinGroup.toJson();
    }
    if (this.writingPattern != null) {
      data['Writing_Pattern'] = this.writingPattern.toJson();
    }
    if (this.typePattern != null) {
      data['Type_Pattern'] = this.typePattern.toJson();
    }
    data['Pattern_Des'] = this.patternDes;
    if (this.patternImg != null) {
      data['pattern_img'] = this.patternImg.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KlinGroup {
  int klinGroupId;
  String klinGroupName;

  KlinGroup({this.klinGroupId, this.klinGroupName});

  KlinGroup.fromJson(Map<String, dynamic> json) {
    klinGroupId = json['Klin_Group_id'];
    klinGroupName = json['Klin_Group_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Klin_Group_id'] = this.klinGroupId;
    data['Klin_Group_Name'] = this.klinGroupName;
    return data;
  }
}

class WritingPattern {
  int writingPatternId;
  String writingPatternName;

  WritingPattern({this.writingPatternId, this.writingPatternName});

  WritingPattern.fromJson(Map<String, dynamic> json) {
    writingPatternId = json['Writing_Pattern_id'];
    writingPatternName = json['Writing_Pattern_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Writing_Pattern_id'] = this.writingPatternId;
    data['Writing_Pattern_Name'] = this.writingPatternName;
    return data;
  }
}

class TypePattern {
  int typePatternId;
  String typePatternName;

  TypePattern({this.typePatternId, this.typePatternName});

  TypePattern.fromJson(Map<String, dynamic> json) {
    typePatternId = json['Type_Pattern_id'];
    typePatternName = json['Type_Pattern_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Type_Pattern_id'] = this.typePatternId;
    data['Type_Pattern_Name'] = this.typePatternName;
    return data;
  }
}

class PatternImg {
  int imgId;
  String img;

  PatternImg({this.imgId, this.img});

  PatternImg.fromJson(Map<String, dynamic> json) {
    imgId = json['img_id'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_id'] = this.imgId;
    data['img'] = this.img;
    return data;
  }
}

class SearchModel {
  String name;

  SearchModel({this.name});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name.trim(),
    };

    return map;
  }
}
