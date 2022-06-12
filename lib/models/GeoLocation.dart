import 'dart:convert';

GeoLocation geoLocationFromJson(String str) => GeoLocation.fromJson(json.decode(str));

String geoLocationToJson(GeoLocation data) => json.encode(data.toJson());

class GeoLocation {
  GeoLocation({
    double? lat,
    double? long,
  }) {
    _lat = lat;
    _long = long;
  }

  GeoLocation.fromJson(dynamic json) {
    _lat = json['Lat'];
    _long = json['Long'];
  }

  double? _lat;
  double? _long;

  double? get lat => _lat;

  double? get long => _long;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Lat'] = _lat;
    map['Long'] = _long;
    return map;
  }
}
