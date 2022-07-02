class SubmitCarInfo {
  int? resultCode;
  Data? data;
  List<String>? failures;

  SubmitCarInfo({this.resultCode, this.data, this.failures});

  SubmitCarInfo.fromJson(Map<String, dynamic> json) {
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
  String? guid;

  Data({this.guid});

  Data.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    return data;
  }
}