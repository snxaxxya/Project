class LoginResponseModel {
  int userID;
  String username;
  String password;
  String firstname;
  String lastname;
  String telephone;
  String email;
  String dateJoined;
  Status status;

  LoginResponseModel(
      {this.userID,
      this.username,
      this.password,
      this.firstname,
      this.lastname,
      this.telephone,
      this.email,
      this.dateJoined,
      this.status});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userID = json['User_ID'];
    username = json['Username'];
    password = json['Password'];
    firstname = json['Firstname'];
    lastname = json['Lastname'];
    telephone = json['Telephone'];
    email = json['Email'];
    dateJoined = json['date_joined'];
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User_ID'] = this.userID;
    data['Username'] = this.username;
    data['Password'] = this.password;
    data['Firstname'] = this.firstname;
    data['Lastname'] = this.lastname;
    data['Telephone'] = this.telephone;
    data['Email'] = this.email;
    data['date_joined'] = this.dateJoined;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class Status {
  String statusID;
  String statusName;

  Status({this.statusID, this.statusName});

  Status.fromJson(Map<String, dynamic> json) {
    statusID = json['status_ID'];
    statusName = json['status_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_ID'] = this.statusID;
    data['status_Name'] = this.statusName;
    return data;
  }
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({this.username, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'Username': username.trim(),
      'Password': password.trim(),
    };

    return map;
  }
}
