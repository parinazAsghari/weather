import 'dart:convert';

import 'package:emdad_khodro_saipa/models/GeoLocation.dart';

SendSubmitServiceInPlaceRequest sendSubmitServiceInPlaceRequestFromJson(String str) => SendSubmitServiceInPlaceRequest.fromJson(json.decode(str));

String sendSubmitServiceInPlaceRequestToJson(SendSubmitServiceInPlaceRequest data) => json.encode(data.toJson());

class SendSubmitServiceInPlaceRequest {
  SendSubmitServiceInPlaceRequest({
    String? mobile,
    String? firstName,
    String? lastName,
    String? nationalCode,
    String? chassisNo,
    GeoLocation? geoLocation,
    String? address,
    List<int>? physicalDisablities,
    String? description,
    List<String>? packageItemsGuids,
  }) {
    _mobile = mobile;
    _firstName = firstName;
    _lastName = lastName;
    _nationalCode = nationalCode;
    _chassisNo = chassisNo;
    _geoLocation = geoLocation;
    _address = address;
    _physicalDisablities = physicalDisablities;
    _description = description;
    _packageItemsGuids = packageItemsGuids;
  }

  SendSubmitServiceInPlaceRequest.fromJson(dynamic json) {
    _mobile = json['Mobile'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _nationalCode = json['NationalCode'];
    _chassisNo = json['ChassisNo'];
    _geoLocation = json['GeoLocation'] != null ? GeoLocation.fromJson(json['GeoLocation']) : null;
    _address = json['Address'];
    _physicalDisablities = json['PhysicalDisablities'] != null ? json['PhysicalDisablities'].cast<int>() : [];
    _description = json['Description'];
    _packageItemsGuids = json['PackageItemsGuids'] != null ? json['PackageItemsGuids'].cast<String>() : [];
  }

  String? _mobile;
  String? _firstName;
  String? _lastName;
  String? _nationalCode;
  String? _chassisNo;
  GeoLocation? _geoLocation;
  String? _address;
  List<int>? _physicalDisablities;
  String? _description;
  List<String>? _packageItemsGuids;

  String? get mobile => _mobile;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get nationalCode => _nationalCode;

  String? get chassisNo => _chassisNo;

  GeoLocation? get geoLocation => _geoLocation;

  String? get address => _address;

  List<int>? get physicalDisablities => _physicalDisablities;

  String? get description => _description;

  List<String>? get packageItemsGuids => _packageItemsGuids;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Mobile'] = _mobile;
    map['FirstName'] = _firstName;
    map['LastName'] = _lastName;
    map['NationalCode'] = _nationalCode;
    map['ChassisNo'] = _chassisNo;
    if (_geoLocation != null) {
      map['GeoLocation'] = _geoLocation?.toJson();
    }
    map['Address'] = _address;
    map['PhysicalDisablities'] = _physicalDisablities;
    map['Description'] = _description;
    map['PackageItemsGuids'] = _packageItemsGuids;
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
