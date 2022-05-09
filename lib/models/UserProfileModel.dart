class UserProfileModel {
  String? fullName;
  String? programName;
  String? neverCall;
  String? neverSMS;
  String? language;
  String? joinDate;
  String? responseDescription;
  String? membershipType;
  String? statementMethod;
  String? receivePartnerPromotionFlag;
  String? membershipNumber;
  String? neverMail;
  String? responseCode;
  String? receivePromotionFlag;
  String? preferredCommunicationMethod;
  String? neverEmail;
  String? neverFax;

  UserProfileModel(
      {this.fullName,
        this.programName,
        this.neverCall,
        this.neverSMS,
        this.language,
        this.joinDate,
        this.responseDescription,
        this.membershipType,
        this.statementMethod,
        this.receivePartnerPromotionFlag,
        this.membershipNumber,
        this.neverMail,
        this.responseCode,
        this.receivePromotionFlag,
        this.preferredCommunicationMethod,
        this.neverEmail,
        this.neverFax});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    fullName = json['FullName'];
    programName = json['ProgramName'];
    neverCall = json['NeverCall'];
    neverSMS = json['NeverSMS'];
    language = json['Language'];
    joinDate = json['JoinDate'];
    responseDescription = json['ResponseDescription'];
    membershipType = json['MembershipType'];
    statementMethod = json['StatementMethod'];
    receivePartnerPromotionFlag = json['ReceivePartnerPromotionFlag'];
    membershipNumber = json['MembershipNumber'];
    neverMail = json['NeverMail'];
    responseCode = json['ResponseCode'];
    receivePromotionFlag = json['ReceivePromotionFlag'];
    preferredCommunicationMethod = json['PreferredCommunicationMethod'];
    neverEmail = json['NeverEmail'];
    neverFax = json['NeverFax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FullName'] = this.fullName;
    data['ProgramName'] = this.programName;
    data['NeverCall'] = this.neverCall;
    data['NeverSMS'] = this.neverSMS;
    data['Language'] = this.language;
    data['JoinDate'] = this.joinDate;
    data['ResponseDescription'] = this.responseDescription;
    data['MembershipType'] = this.membershipType;
    data['StatementMethod'] = this.statementMethod;
    data['ReceivePartnerPromotionFlag'] = this.receivePartnerPromotionFlag;
    data['MembershipNumber'] = this.membershipNumber;
    data['NeverMail'] = this.neverMail;
    data['ResponseCode'] = this.responseCode;
    data['ReceivePromotionFlag'] = this.receivePromotionFlag;
    data['PreferredCommunicationMethod'] = this.preferredCommunicationMethod;
    data['NeverEmail'] = this.neverEmail;
    data['NeverFax'] = this.neverFax;
    return data;
  }
}