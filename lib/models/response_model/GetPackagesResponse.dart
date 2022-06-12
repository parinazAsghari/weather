import 'dart:convert';

GetPackagesResponse getPackagesResponseFromJson(String str) => GetPackagesResponse.fromJson(json.decode(str));

String getPackagesResponseToJson(GetPackagesResponse data) => json.encode(data.toJson());

class GetPackagesResponse {
  GetPackagesResponse({
    int? resultCode,
    Data? data,
    dynamic failures,
  }) {
    _resultCode = resultCode;
    _data = data;
    _failures = failures;
  }

  GetPackagesResponse.fromJson(dynamic json) {
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
    List<Packages>? packages,
  }) {
    _packages = packages;
  }

  Data.fromJson(dynamic json) {
    if (json['packages'] != null) {
      _packages = [];
      json['packages'].forEach((v) {
        _packages?.add(Packages.fromJson(v));
      });
    }
  }

  List<Packages>? _packages;

  List<Packages>? get packages => _packages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_packages != null) {
      map['packages'] = _packages?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Packages packagesFromJson(String str) => Packages.fromJson(json.decode(str));

String packagesToJson(Packages data) => json.encode(data.toJson());

class Packages {
  Packages({
    String? guid,
    String? title,
    String? code,
    List<Items>? items,
  }) {
    _guid = guid;
    _title = title;
    _code = code;
    _items = items;
  }

  Packages.fromJson(dynamic json) {
    _guid = json['guid'];
    _title = json['title'];
    _code = json['code'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(Items.fromJson(v));
      });
    }
  }

  String? _guid;
  String? _title;
  String? _code;
  List<Items>? _items;

  String? get guid => _guid;

  String? get title => _title;

  String? get code => _code;

  List<Items>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = _guid;
    map['title'] = _title;
    map['code'] = _code;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Items itemsFromJson(String str) => Items.fromJson(json.decode(str));

String itemsToJson(Items data) => json.encode(data.toJson());

class Items {
  Items({
    String? guid,
    String? title,
    int? price,
    String? pictureUrl,
  }) {
    _guid = guid;
    _title = title;
    _price = price;
    _pictureUrl = pictureUrl;
  }

  Items.fromJson(dynamic json) {
    _guid = json['guid'];
    _title = json['title'];
    _price = json['price'];
    _pictureUrl = json['pictureUrl'];
  }

  String? _guid;
  String? _title;
  int? _price;
  String? _pictureUrl;

  String? get guid => _guid;

  String? get title => _title;

  int? get price => _price;

  String? get pictureUrl => _pictureUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guid'] = _guid;
    map['title'] = _title;
    map['price'] = _price;
    map['pictureUrl'] = _pictureUrl;
    return map;
  }
}
