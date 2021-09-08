
class RegisResponseModel {
  int userId;
  String username;
  String password;
  String firstname;
  String lastname;
  String telephone;
  String email;
  DateTime dateJoined;
  Status status;

  RegisResponseModel({
    this.userId,
    this.username,
    this.password,
    this.firstname,
    this.lastname,
    this.telephone,
    this.email,
    this.dateJoined,
    this.status,
  });

  factory RegisResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisResponseModel(
      userId: json["User_ID"],
      username: json["Username"],
      password: json["Password"],
      firstname: json["Firstname"],
      lastname: json["Lastname"],
      telephone: json["Telephone"],
      email: json["Email"],
      dateJoined: DateTime.parse(json["date_joined"]),
      status: Status.fromJson(json["status"]),
    );
  }
}

class RegisRequestModel {
  String username;
  String password;
  String firstname;
  String lastname;
  String telephone;
  String email;

  RegisRequestModel(
      {this.username,
      this.password,
      this.firstname,
      this.lastname,
      this.telephone,
      this.email});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'Username': username.trim(),
      'Password': password.trim(),
      'Firstname': firstname.trim(),
      'Lastname': lastname.trim(),
      'Telephone': telephone.trim(),
      'Email': email.trim(),
    };

    return map;
  }
}
class Status {
    Status({
        this.statusId,
        this.statusName,
    });

    String statusId;
    String statusName;

    factory Status.fromJson(Map<String, dynamic> json) => Status(
        statusId: json["status_ID"],
        statusName: json["status_Name"],
    );

    Map<String, dynamic> toJson() => {
        "status_ID": statusId,
        "status_Name": statusName,
    };
}