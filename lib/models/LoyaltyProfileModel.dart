class LoyaltyProfileModel {
  String? membershipType;
  String? tierName;
  String? responseDescription;
  String? programName;
  String? responseCode;
  String? joinDate;
  String? point1Value;
  String? membershipNumber;

  LoyaltyProfileModel(
      {this.membershipType,
        this.tierName,
        this.responseDescription,
        this.programName,
        this.responseCode,
        this.joinDate,
        this.point1Value,
        this.membershipNumber});

  LoyaltyProfileModel.fromJson(Map<String, dynamic> json) {
    membershipType = json['MembershipType'];
    tierName = json['TierName'];
    responseDescription = json['ResponseDescription'];
    programName = json['ProgramName'];
    responseCode = json['ResponseCode'];
    joinDate = json['JoinDate'];
    point1Value = json['Point1Value'];
    membershipNumber = json['MembershipNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MembershipType'] = this.membershipType;
    data['TierName'] = this.tierName;
    data['ResponseDescription'] = this.responseDescription;
    data['ProgramName'] = this.programName;
    data['ResponseCode'] = this.responseCode;
    data['JoinDate'] = this.joinDate;
    data['Point1Value'] = this.point1Value;
    data['MembershipNumber'] = this.membershipNumber;
    return data;
  }
}