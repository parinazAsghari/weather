import 'dart:convert';

SendGetPackagesRequest sendGetPackagesRequestFromJson(String str) => SendGetPackagesRequest.fromJson(json.decode(str));

String sendGetPackagesRequestToJson(SendGetPackagesRequest data) => json.encode(data.toJson());

class SendGetPackagesRequest {
  SendGetPackagesRequest({
    String? chassisNo,
    int? distanceTraveled,
  }) {
    _chassisNo = chassisNo;
    _distanceTraveled = distanceTraveled;
  }

  SendGetPackagesRequest.fromJson(dynamic json) {
    _chassisNo = json['ChassisNo'];
    _distanceTraveled = json['DistanceTraveled'];
  }

  String? _chassisNo;
  int? _distanceTraveled;

  String? get chassisNo => _chassisNo;

  int? get distanceTraveled => _distanceTraveled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ChassisNo'] = _chassisNo;
    map['DistanceTraveled'] = _distanceTraveled;
    return map;
  }
}
