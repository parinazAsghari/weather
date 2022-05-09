

import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class LoanPaymentsModel {
  String? responseDescription;
  String? responseCode;
  List<Result>? result;

  LoanPaymentsModel({this.responseDescription, this.responseCode, this.result});

  LoanPaymentsModel.fromJson(Map<String, dynamic> json) {
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    // result = new List<Result>();
    if (json['Result'] != null && json['Result'] !='[]') {

      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(repaymentNumber: getSubStringBetween(element, 'RepaymentNumber:', ','),repaymentDate: getSubStringBetween(element, 'RepaymentDate:', ','),pointName: getSubStringBetween(element, 'PointName:', ','),repayedPoints: getSubStringBetween(element, 'RepayedPoints:', ','),status: getSubStringBetween(element, 'Status:', ',')));
      });

//      json['Result'].forEach((v) {
//        result.add(new Result.fromJson(v));
//      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseDescription'] = this.responseDescription;
    data['ResponseCode'] = this.responseCode;
    if (this.result != null) {
      // data['Result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? repaymentNumber;
  String? repaymentDate;
  String? pointName;
  String? repayedPoints;
  String? status;

  Result(
      {this.repaymentNumber,
        this.repaymentDate,
        this.pointName,
        this.repayedPoints,
        this.status});

  Result.fromJson(Map<String, dynamic> json) {
    repaymentNumber = json['RepaymentNumber'];
    repaymentDate = json['RepaymentDate'];
    pointName = json['PointName'];
    repayedPoints = json['RepayedPoints'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RepaymentNumber'] = this.repaymentNumber;
    data['RepaymentDate'] = this.repaymentDate;
    data['PointName'] = this.pointName;
    data['RepayedPoints'] = this.repayedPoints;
    data['Status'] = this.status;
    return data;
  }
}