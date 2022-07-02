class SubmitHomeServiceRequest {
  String? token;
  String? mobileNumber;
  String? lastName;
  String? nationalCode;
  String? chassisNo;
  double? latitude;
  double? longitude;
  String? address;
  List<int>? physicalDisablities;
  String? description;
  String? dateJalali;
  String? time;
  int? coverCarId;
  int? distanceTraveledKm;
  List<int>? packageSubServiceIds;
  int? emdadgarId;

  SubmitHomeServiceRequest(
      {this.token,
        this.mobileNumber,
        this.lastName,
        this.nationalCode,
        this.chassisNo,
        this.latitude,
        this.longitude,
        this.address,
        this.physicalDisablities,
        this.description,
        this.dateJalali,
        this.time,
        this.coverCarId,
        this.distanceTraveledKm,
        this.packageSubServiceIds,
        this.emdadgarId});

  SubmitHomeServiceRequest.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    mobileNumber = json['mobileNumber'];
    lastName = json['lastName'];
    nationalCode = json['nationalCode'];
    chassisNo = json['chassisNo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    physicalDisablities = json['physicalDisablities'].cast<int>();
    description = json['description'];
    dateJalali = json['dateJalali'];
    time = json['time'];
    coverCarId = json['coverCarId'];
    distanceTraveledKm = json['distanceTraveledKm'];
    packageSubServiceIds = json['packageSubServiceIds'].cast<int>();
    emdadgarId = json['emdadgarId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Token'] = this.token;
    data['mobileNumber'] = this.mobileNumber;
    data['lastName'] = this.lastName;
    data['nationalCode'] = this.nationalCode;
    data['chassisNo'] = this.chassisNo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['physicalDisablities'] = this.physicalDisablities;
    data['description'] = this.description;
    data['dateJalali'] = this.dateJalali;
    data['time'] = this.time;
    data['coverCarId'] = this.coverCarId;
    data['distanceTraveledKm'] = this.distanceTraveledKm;
    data['packageSubServiceIds'] = this.packageSubServiceIds;
    data['emdadgarId'] = this.emdadgarId;
    return data;
  }
}