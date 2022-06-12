import 'dart:convert';

import 'package:emdad_khodro_saipa/models/GeoLocation.dart';

SendGetReservableRequest sendGetReservableRequestFromJson(String str) => SendGetReservableRequest.fromJson(json.decode(str));

String sendGetReservableRequestToJson(SendGetReservableRequest data) => json.encode(data.toJson());

class SendGetReservableRequest {
  SendGetReservableRequest({
    List<String>? packageItemsGuids,
    GeoLocation? geoLocation,
    String? emdadgarGuid,
  }) {
    _packageItemsGuids = packageItemsGuids;
    _geoLocation = geoLocation;
    _emdadgarGuid = emdadgarGuid;
  }

  SendGetReservableRequest.fromJson(dynamic json) {
    _packageItemsGuids = json['PackageItemsGuids'] != null ? json['PackageItemsGuids'].cast<String>() : [];
    _geoLocation = json['GeoLocation'] != null ? GeoLocation.fromJson(json['GeoLocation']) : null;
    _emdadgarGuid = json['EmdadgarGuid'];
  }

  List<String>? _packageItemsGuids;
  GeoLocation? _geoLocation;
  String? _emdadgarGuid;

  List<String>? get packageItemsGuids => _packageItemsGuids;

  GeoLocation? get geoLocation => _geoLocation;

  String? get emdadgarGuid => _emdadgarGuid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PackageItemsGuids'] = _packageItemsGuids;
    if (_geoLocation != null) {
      map['GeoLocation'] = _geoLocation?.toJson();
    }
    map['EmdadgarGuid'] = _emdadgarGuid;
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
