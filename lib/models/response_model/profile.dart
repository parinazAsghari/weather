class GetProfile {
  int? resultCode;
  Data? data;
  List<dynamic>? failures;

  GetProfile({this.resultCode, this.data, this.failures});

  GetProfile.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    failures = json['failures'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['failures'] = this.failures;
    return data;
  }
}

class Data {
  String? guid;
  String? firstName;
  String? lastName;
  String? fullName;
  String? mobileNumber;
  String? nationalCode;
  List<CarInfos>? carInfos;
  List<Defects>? defects;
  List<CoverCars>? coverCars;
  List<Packages>? packages;

  Data(
      {this.guid,
        this.firstName,
        this.lastName,
        this.fullName,
        this.mobileNumber,
        this.nationalCode,
        this.carInfos,
        this.defects,
        this.coverCars,
        this.packages});

  Data.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    mobileNumber = json['mobileNumber'];
    nationalCode = json['nationalCode'];
    if (json['carInfos'] != null) {
      carInfos = <CarInfos>[];
      json['carInfos'].forEach((v) {
        carInfos!.add(new CarInfos.fromJson(v));
      });
    }
    if (json['defects'] != null) {
      defects = <Defects>[];
      json['defects'].forEach((v) {
        defects!.add(new Defects.fromJson(v));
      });
    }
    if (json['coverCars'] != null) {
      coverCars = <CoverCars>[];
      json['coverCars'].forEach((v) {
        coverCars!.add(new CoverCars.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fullName'] = this.fullName;
    data['mobileNumber'] = this.mobileNumber;
    data['nationalCode'] = this.nationalCode;
    if (this.carInfos != null) {
      data['carInfos'] = this.carInfos!.map((v) => v.toJson()).toList();
    }
    if (this.defects != null) {
      data['defects'] = this.defects!.map((v) => v.toJson()).toList();
    }
    if (this.coverCars != null) {
      data['coverCars'] = this.coverCars!.map((v) => v.toJson()).toList();
    }
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarInfos {
  String? guid;
  String? name;
  int? productionYear;
  String? licensePlateNo;
  String? chassisNo;
  String? vin;

  CarInfos(
      {this.guid,
        this.name,
        this.productionYear,
        this.licensePlateNo,
        this.chassisNo,
        this.vin});

  CarInfos.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    productionYear = json['productionYear'];
    licensePlateNo = json['licensePlateNo'];
    chassisNo = json['chassisNo'];
    vin = json['vin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['productionYear'] = this.productionYear;
    data['licensePlateNo'] = this.licensePlateNo;
    data['chassisNo'] = this.chassisNo;
    data['vin'] = this.vin;
    return data;
  }
}

class Defects {
  int? code;
  String? title;

  Defects({this.code, this.title});

  Defects.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['title'] = this.title;
    return data;
  }
}

class CoverCars {
  int? id;
  String? name;

  CoverCars({this.id, this.name});

  CoverCars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Packages {
  int? id;
  String? name;

  Packages({this.id, this.name});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}