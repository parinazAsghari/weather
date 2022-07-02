class GetPackagesSubServices {
  int? resultCode;
  List<Data>? data;
  List<String>? failures;

  GetPackagesSubServices({this.resultCode, this.data, this.failures});

  GetPackagesSubServices.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    failures = json['failures'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['failures'] = this.failures;
    return data;
  }
}

class Data {
  String? id;
  String? code;
  String? name;
  String? description;
  String? fullDescription;
  int? totalPrice;
  int? discount;
  int? packageId;
  String? imageBase64;
  bool? isVipPackage;

  Data(
      {this.id,
        this.code,
        this.name,
        this.description,
        this.fullDescription,
        this.totalPrice,
        this.discount,
        this.packageId,
        this.imageBase64,
        this.isVipPackage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
    fullDescription = json['fullDescription'];
    totalPrice = json['totalPrice'];
    discount = json['discount'];
    packageId = json['packageId'];
    imageBase64 = json['imageBase64'];
    isVipPackage = json['isVipPackage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['description'] = this.description;
    data['fullDescription'] = this.fullDescription;
    data['totalPrice'] = this.totalPrice;
    data['discount'] = this.discount;
    data['packageId'] = this.packageId;
    data['imageBase64'] = this.imageBase64;
    data['isVipPackage'] = this.isVipPackage;
    return data;
  }
}