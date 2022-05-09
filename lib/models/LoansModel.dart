
import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class LoansModel {
  String? responseCode;
  String? responseDescriptio;
  List<Result>? result;

  LoansModel({this.responseCode, this.responseDescriptio, this.result});

  LoansModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['ResponseCode'];
    responseDescriptio = json['ResponseDescriptio'];
    if (json['Result'] != null && json['Result'] !='[]') {
      // result = new List<Result>();
      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(transactionId: getSubStringBetween(element, 'TransactionId:', ','),transactionNumber: getSubStringBetween(element, 'TransactionNumber:', ','),transactionDate: getSubStringBetween(element, 'TransactionDate:', ','),pointName: getSubStringBetween(element, 'PointName:', ','),points: getSubStringBetween(element, 'Points:', ','),currentLoanBalance: getSubStringBetween(element, 'CurrentLoanBalance:', ','),isRepaid: getSubStringBetween(element, 'IsRepaid:', ','),loanRepaymentDate: getSubStringBetween(element, 'LoanRepaymentDate:', ','),status: getSubStringBetween(element, 'Status:', ',')));
      });
//      json['Result'].forEach((v) {
//        result.add(new Result.fromJson(v));
//      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseCode'] = this.responseCode;
    data['ResponseDescriptio'] = this.responseDescriptio;
    if (this.result != null) {
      // data['Result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? transactionId;
  String? transactionNumber;
  String? transactionDate;
  String? pointName;
  String? points;
  String? currentLoanBalance;
  String? isRepaid;
  String? loanRepaymentDate;
  String? status;

  Result(
      {this.transactionId,
        this.transactionNumber,
        this.transactionDate,
        this.pointName,
        this.points,
        this.currentLoanBalance,
        this.isRepaid,
        this.loanRepaymentDate,
        this.status});

  Result.fromJson(Map<String, dynamic> json) {
    transactionId = json['TransactionId'];
    transactionNumber = json['TransactionNumber'];
    transactionDate = json['TransactionDate'];
    pointName = json['PointName'];
    points = json['Points'];
    currentLoanBalance = json['CurrentLoanBalance'];
    isRepaid = json['IsRepaid'];
    loanRepaymentDate = json['LoanRepaymentDate'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TransactionId'] = this.transactionId;
    data['TransactionNumber'] = this.transactionNumber;
    data['TransactionDate'] = this.transactionDate;
    data['PointName'] = this.pointName;
    data['Points'] = this.points;
    data['CurrentLoanBalance'] = this.currentLoanBalance;
    data['IsRepaid'] = this.isRepaid;
    data['LoanRepaymentDate'] = this.loanRepaymentDate;
    data['Status'] = this.status;
    return data;
  }
}