class ActiveTierModel {
  String? tierClass;
  String? tierName;
  String? responseDescription;
  String? responseCode;
  String? tierEndDate;
  String? tierStartDate;

  ActiveTierModel(
      {this.tierClass,
        this.tierName,
        this.responseDescription,
        this.responseCode,
        this.tierEndDate,
        this.tierStartDate});

  ActiveTierModel.fromJson(Map<String, dynamic> json) {
    tierClass = json['TierClass'];
    tierName = json['TierName'];
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    tierEndDate = json['TierEndDate'];
    tierStartDate = json['TierStartDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TierClass'] = this.tierClass;
    data['TierName'] = this.tierName;
    data['ResponseDescription'] = this.responseDescription;
    data['ResponseCode'] = this.responseCode;
    data['TierEndDate'] = this.tierEndDate;
    data['TierStartDate'] = this.tierStartDate;
    return data;
  }
}