import 'dart:convert';

GetReservableDatesResponse getReservableDatesResponseFromJson(String str) => GetReservableDatesResponse.fromJson(json.decode(str));

String getReservableDatesResponseToJson(GetReservableDatesResponse data) => json.encode(data.toJson());

class GetReservableDatesResponse {
  GetReservableDatesResponse({
    int? resultCode,
    Data? data,
    dynamic failures,
  }) {
    _resultCode = resultCode;
    _data = data;
    _failures = failures;
  }

  GetReservableDatesResponse.fromJson(dynamic json) {
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
    List<Dates>? dates,
  }) {
    _dates = dates;
  }

  Data.fromJson(dynamic json) {
    if (json['dates'] != null) {
      _dates = [];
      json['dates'].forEach((v) {
        _dates?.add(Dates.fromJson(v));
      });
    }
  }

  List<Dates>? _dates;

  List<Dates>? get dates => _dates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_dates != null) {
      map['dates'] = _dates?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Dates datesFromJson(String str) => Dates.fromJson(json.decode(str));

String datesToJson(Dates data) => json.encode(data.toJson());

class Dates {
  Dates({
    String? date,
    String? jalaliDate,
    List<Times>? times,
  }) {
    _date = date;
    _jalaliDate = jalaliDate;
    _times = times;
  }

  Dates.fromJson(dynamic json) {
    _date = json['date'];
    _jalaliDate = json['jalaliDate'];
    if (json['times'] != null) {
      _times = [];
      json['times'].forEach((v) {
        _times?.add(Times.fromJson(v));
      });
    }
  }

  String? _date;
  String? _jalaliDate;
  List<Times>? _times;

  String? get date => _date;

  String? get jalaliDate => _jalaliDate;

  List<Times>? get times => _times;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['jalaliDate'] = _jalaliDate;
    if (_times != null) {
      map['times'] = _times?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Times timesFromJson(String str) => Times.fromJson(json.decode(str));

String timesToJson(Times data) => json.encode(data.toJson());

class Times {
  Times({
    String? value,
  }) {
    _value = value;
  }

  Times.fromJson(dynamic json) {
    _value = json['value'];
  }

  String? _value;

  String? get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = _value;
    return map;
  }
}
