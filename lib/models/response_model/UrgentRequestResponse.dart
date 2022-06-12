class UrgentRequestResponse {
  UrgentRequestResponse({
    int? resultCode,
    Data? data,
    dynamic failures,
  }) {
    _resultCode = resultCode;
    _data = data;
    _failures = failures;
  }

  UrgentRequestResponse.fromJson(dynamic json) {
    _resultCode = json['resultCode'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _failures = json['failures'];
  }

  int? _resultCode;
  Data? _data;
  dynamic _failures;

  int? get resultCode => _resultCode;

  Data? get data => _data;

  dynamic get failures => _failures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resultCode'] = _resultCode;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['failures'] = _failures;
    return map;
  }
}

class Data {
  Data({
    String? trackingCode,
  }) {
    _trackingCode = trackingCode;
  }

  Data.fromJson(dynamic json) {
    _trackingCode = json['trackingCode'];
  }

  String? _trackingCode;

  String? get trackingCode => _trackingCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['trackingCode'] = _trackingCode;
    return map;
  }
}
