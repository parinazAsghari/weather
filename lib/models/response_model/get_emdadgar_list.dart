class GetEmdadGarList {
  int? resultCode;
  Data? data;
  List<dynamic>? failures;

  GetEmdadGarList({this.resultCode, this.data, this.failures});

  GetEmdadGarList.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    failures = json['failures'].cast<String>();
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
  List<EmdadgarList>? emdadgarList;

  Data({this.emdadgarList});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['emdadgarList'] != null) {
      emdadgarList = <EmdadgarList>[];
      json['emdadgarList'].forEach((v) {
        emdadgarList!.add(new EmdadgarList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.emdadgarList != null) {
      data['emdadgarList'] = this.emdadgarList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmdadgarList {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? imageBase64;
  double? score;

  EmdadgarList(
      {this.id,
        this.firstName,
        this.lastName,
        this.fullName,
        this.imageBase64,
        this.score});

  EmdadgarList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    imageBase64 = json['imageBase64'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['imageBase64'] = this.imageBase64;
    data['score'] = this.score;
    return data;
  }
}