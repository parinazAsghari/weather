class ExclusivePackageActivationResponseModel {
  String? transactionStatus;
  String? responseDescription;
  String? responseCode;
  String? transactionSubStatus;
  String? recordId;

  ExclusivePackageActivationResponseModel(
      {this.transactionStatus,
        this.responseDescription,
        this.responseCode,
        this.transactionSubStatus,
        this.recordId});

  ExclusivePackageActivationResponseModel.fromJson(Map<String, dynamic> json) {
    transactionStatus = json['TransactionStatus'];
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    transactionSubStatus = json['TransactionSubStatus'];
    recordId = json['RecordId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TransactionStatus'] = this.transactionStatus;
    data['ResponseDescription'] = this.responseDescription;
    data['ResponseCode'] = this.responseCode;
    data['TransactionSubStatus'] = this.transactionSubStatus;
    data['RecordId'] = this.recordId;
    return data;
  }
}