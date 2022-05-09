class ExclusivePackageModel {
  String? packageVolume;
  String? mainPrice;
  String? responseDescription;
  String? responseCode;
  String? offeredPackage;
  String? validDays;

  ExclusivePackageModel(
      {this.packageVolume,
        this.mainPrice,
        this.responseDescription,
        this.responseCode,
        this.offeredPackage,
        this.validDays});

  ExclusivePackageModel.fromJson(Map<String, dynamic> json) {
    packageVolume = json['PackageVolume'];
    mainPrice = json['MainPrice'];
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    offeredPackage = json['OfferedPackage'];
    validDays = json['ValidDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PackageVolume'] = this.packageVolume;
    data['MainPrice'] = this.mainPrice;
    data['ResponseDescription'] = this.responseDescription;
    data['ResponseCode'] = this.responseCode;
    data['OfferedPackage'] = this.offeredPackage;
    data['ValidDays'] = this.validDays;
    return data;
  }
}