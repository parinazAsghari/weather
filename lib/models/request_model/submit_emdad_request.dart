class SubmitEmdadRequest {
  String? token;
  String? mobile;
  String? firstName;
  String? lastName;
  String? chassisNo;
  double? latitude;
  double? longitude;
  String? address;
  int? defectCode;
  String? description;

  SubmitEmdadRequest(
      {this.token,
        this.mobile,
        this.firstName,
        this.lastName,
        this.chassisNo,
        this.latitude,
        this.longitude,
        this.address,
        this.defectCode,
        this.description});

  SubmitEmdadRequest.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    mobile = json['mobile'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    chassisNo = json['chassisNo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    defectCode = json['defectCode'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    data['mobile'] = this.mobile;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['chassisNo'] = this.chassisNo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['defectCode'] = this.defectCode;
    data['description'] = this.description;
    return data;
  }
}