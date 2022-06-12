import 'package:emdad_khodro_saipa/models/GeoLocation.dart';

class SendEmdadRequest {
  SendEmdadRequest({
    String? mobile,
    String? firstName,
    String? lastName,
    String? nationalCode,
    String? chassisNo,
    GeoLocation? geoLocation,
    String? address,
    List<int>? physicalDisablities,
    int? issueType,
    String? description,
  }) {
    _mobile = mobile;
    _firstName = firstName;
    _lastName = lastName;
    _nationalCode = nationalCode;
    _chassisNo = chassisNo;
    _geoLocation = geoLocation;
    _address = address;
    _physicalDisablities = physicalDisablities;
    _issueType = issueType;
    _description = description;
  }

  SendEmdadRequest.fromJson(dynamic json) {
    _mobile = json['Mobile'];
    _firstName = json['FirstName'];
    _lastName = json['LastName'];
    _nationalCode = json['NationalCode'];
    _chassisNo = json['ChassisNo'];
    _geoLocation = json['GeoLocation'] != null ? GeoLocation.fromJson(json['GeoLocation']) : null;
    _address = json['Address'];
    _physicalDisablities = json['PhysicalDisablities'] != null ? json['PhysicalDisablities'].cast<int>() : [];
    _issueType = json['IssueType'];
    _description = json['Description'];
  }

  String? _mobile;
  String? _firstName;
  String? _lastName;
  String? _nationalCode;
  String? _chassisNo;
  GeoLocation? _geoLocation;
  String? _address;
  List<int>? _physicalDisablities;
  int? _issueType;
  String? _description;

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
    map['IssueType'] = _issueType;
    map['Description'] = _description;
    return map;
  }
}

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
// GeoLocation copyWith({  double? lat,
//   double? long,
// }) => GeoLocation(  lat: lat ?? _lat,
//   long: long ?? _long,
// );
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
