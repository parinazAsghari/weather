import 'dart:convert';

GetEmdadgarListResponse getEmdadgarListResponseFromJson(String str) => GetEmdadgarListResponse.fromJson(json.decode(str));

String getEmdadgarListResponseToJson(GetEmdadgarListResponse data) => json.encode(data.toJson());

class GetEmdadgarListResponse {
  GetEmdadgarListResponse({
    int? resultCode,
    Data? data,
    dynamic failures,
  }) {
    _resultCode = resultCode;
    _data = data;
    _failures = failures;
  }

  GetEmdadgarListResponse.fromJson(dynamic json) {
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

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    List<EmdadgarList>? emdadgarList,
  }) {
    _emdadgarList = emdadgarList;
  }

  Data.fromJson(dynamic json) {
    if (json['emdadgarList'] != null) {
      _emdadgarList = [];
      json['emdadgarList'].forEach((v) {
        _emdadgarList?.add(EmdadgarList.fromJson(v));
      });
    }
  }

  List<EmdadgarList>? _emdadgarList;

  List<EmdadgarList>? get emdadgarList => _emdadgarList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_emdadgarList != null) {
      map['emdadgarList'] = _emdadgarList?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

EmdadgarList emdadgarListFromJson(String str) => EmdadgarList.fromJson(json.decode(str));

String emdadgarListToJson(EmdadgarList data) => json.encode(data.toJson());

class EmdadgarList {
  EmdadgarList({
    String? guid,
    String? fullName,
    double? score,
    String? pictureUrl,
  }) {
    _guid = guid;
    _fullName = fullName;
    _score = score;
    _pictureUrl = pictureUrl;
  }

  EmdadgarList.fromJson(dynamic json) {
    _guid = json['guid'];
    _fullName = json['fullName'];
    _score = json['score'];
    _pictureUrl = json['pictureUrl'];
  }

  String? _guid;
  String? _fullName;
  double? _score;
  String? _pictureUrl;

  String? get guid => _guid;

  String? get fullName => _fullName;

  double? get score => _score;

  String? get pictureUrl => _pictureUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = _guid;
    map['fullName'] = _fullName;
    map['score'] = _score;
    map['pictureUrl'] = _pictureUrl;
    return map;
  }
}
