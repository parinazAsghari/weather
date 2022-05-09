class ScoreInfoModel {
  String? point4Name;
  String? point4Value;
  String? point1Accrual;
  String? point4Accrual;
  String? point2Accrual;
  String? point1Redemption;
  String? point1Name;
  String? point2Redemption;
  String? point3Name;
  String? point3Redemption;
  String? point3Accrual;
  String? responseDescription;
  String? point1Value;
  String? point4Redemption;
  String? point2Name;
  String? point2Value;
  String? point3Value;
  String? responeCode;

  ScoreInfoModel(
      {this.point4Name,
        this.point4Value,
        this.point1Accrual,
        this.point4Accrual,
        this.point2Accrual,
        this.point1Redemption,
        this.point1Name,
        this.point2Redemption,
        this.point3Name,
        this.point3Redemption,
        this.point3Accrual,
        this.responseDescription,
        this.point1Value,
        this.point4Redemption,
        this.point2Name,
        this.point2Value,
        this.point3Value,
        this.responeCode});

  ScoreInfoModel.fromJson(Map<String, dynamic> json) {
    point4Name = json['Point4Name'];
    point4Value = json['Point4Value'];
    point1Accrual = json['Point1Accrual'];
    point4Accrual = json['Point4Accrual'];
    point2Accrual = json['Point2Accrual'];
    point1Redemption = json['Point1Redemption'];
    point1Name = json['Point1Name'];
    point2Redemption = json['Point2Redemption'];
    point3Name = json['Point3Name'];
    point3Redemption = json['Point3Redemption'];
    point3Accrual = json['Point3Accrual'];
    responseDescription = json['ResponseDescription'];
    point1Value = json['Point1Value'];
    point4Redemption = json['Point4Redemption'];
    point2Name = json['Point2Name'];
    point2Value = json['Point2Value'];
    point3Value = json['Point3Value'];
    responeCode = json['ResponeCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Point4Name'] = this.point4Name;
    data['Point4Value'] = this.point4Value;
    data['Point1Accrual'] = this.point1Accrual;
    data['Point4Accrual'] = this.point4Accrual;
    data['Point2Accrual'] = this.point2Accrual;
    data['Point1Redemption'] = this.point1Redemption;
    data['Point1Name'] = this.point1Name;
    data['Point2Redemption'] = this.point2Redemption;
    data['Point3Name'] = this.point3Name;
    data['Point3Redemption'] = this.point3Redemption;
    data['Point3Accrual'] = this.point3Accrual;
    data['ResponseDescription'] = this.responseDescription;
    data['Point1Value'] = this.point1Value;
    data['Point4Redemption'] = this.point4Redemption;
    data['Point2Name'] = this.point2Name;
    data['Point2Value'] = this.point2Value;
    data['Point3Value'] = this.point3Value;
    data['ResponeCode'] = this.responeCode;
    return data;
  }
}




























/*


class ScoreInfoModel {
  String point1DisplayName;
  String point2Value;
  String responseDescription;
  String point3Value;
  String responseCode;
  String point4DisplayName;
  String point3DisplayName;
  String point4Value;
  String point1Value;
  String point2DisplayName;

  ScoreInfoModel(
      {this.point1DisplayName,
        this.point2Value,
        this.responseDescription,
        this.point3Value,
        this.responseCode,
        this.point4DisplayName,
        this.point3DisplayName,
        this.point4Value,
        this.point1Value,
        this.point2DisplayName});

  ScoreInfoModel.fromJson(Map<String, dynamic> json) {
    point1DisplayName = json['Point1DisplayName'];
    point2Value = json['Point2Value'];
    responseDescription = json['ResponseDescription'];
    point3Value = json['Point3Value'];
    responseCode = json['ResponseCode'];
    point4DisplayName = json['Point4DisplayName'];
    point3DisplayName = json['Point3DisplayName'];
    point4Value = json['Point4Value'];
    point1Value = json['Point1Value'];
    point2DisplayName = json['Point2DisplayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Point1DisplayName'] = this.point1DisplayName;
    data['Point2Value'] = this.point2Value;
    data['ResponseDescription'] = this.responseDescription;
    data['Point3Value'] = this.point3Value;
    data['ResponseCode'] = this.responseCode;
    data['Point4DisplayName'] = this.point4DisplayName;
    data['Point3DisplayName'] = this.point3DisplayName;
    data['Point4Value'] = this.point4Value;
    data['Point1Value'] = this.point1Value;
    data['Point2DisplayName'] = this.point2DisplayName;
    return data;
  }
}

 */