import 'dart:convert';

import 'package:emdad_khodro_saipa/models/GeoLocation.dart';

SendGetEmdadgarList sendGetEmdadgarListFromJson(String str) => SendGetEmdadgarList.fromJson(json.decode(str));

String sendGetEmdadgarListToJson(SendGetEmdadgarList data) => json.encode(data.toJson());

class SendGetEmdadgarList {
  SendGetEmdadgarList({
    String? packageGuid,
    GeoLocation? geoLocation,
  }) {
    _packageGuid = packageGuid;
    _geoLocation = geoLocation;
  }

  SendGetEmdadgarList.fromJson(dynamic json) {
    _packageGuid = json['PackageGuid'];
    _geoLocation = json['GeoLocation'] != null ? GeoLocation.fromJson(json['GeoLocation']) : null;
  }

  String? _packageGuid;
  GeoLocation? _geoLocation;

  String? get packageGuid => _packageGuid;

  GeoLocation? get geoLocation => _geoLocation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PackageGuid'] = _packageGuid;
    if (_geoLocation != null) {
      map['GeoLocation'] = _geoLocation?.toJson();
    }
    return map;
  }
}

// GeoLocation geoLocationFromJson(String str) => GeoLocation.fromJson(json.decode(str));
// String geoLocationToJson(GeoLocation data) => json.encode(data.toJson());
// class GeoLocation {
//   GeoLocation({
//       double? lat,
//       double? long,}){
//     _lat = lat;
//     _long = long;
// }
//
//   GeoLocation.fromJson(dynamic json) {
//     _lat = json['Lat'];
//     _long = json['Long'];
//   }
//   double? _lat;
//   double? _long;
//
//   double? get lat => _lat;
//   double? get long => _long;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['Lat'] = _lat;
//     map['Long'] = _long;
//     return map;
//   }
//
// }
