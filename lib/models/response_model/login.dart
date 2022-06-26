class Login {
  int? resultCode;
  Data? data;
  List<dynamic>? failures;

  Login({this.resultCode, this.data, this.failures});

  Login.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    failures = json['failures'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['failures'] = this.failures;
    return data;
  }
}

class Data {
  String? guid;
  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? fullName;

  Data(
      {this.guid,
        this.firstName,
        this.lastName,
        this.mobileNumber,
        this.fullName});

  Data.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNumber = json['mobileNumber'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobileNumber'] = this.mobileNumber;
    data['fullName'] = this.fullName;
    return data;
  }
}