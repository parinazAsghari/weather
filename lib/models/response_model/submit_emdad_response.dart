class SubmitEmdadResponse {
  int? resultCode;
  Data? data;
  List<dynamic>? failures;

  SubmitEmdadResponse({this.resultCode, this.data, this.failures});

  SubmitEmdadResponse.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['failures'] != null) {
      failures = <dynamic>[];
      json['failures'].forEach((v) {
        failures!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.failures != null) {
      data['failures'] = this.failures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? message;

  Data({this.message});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}