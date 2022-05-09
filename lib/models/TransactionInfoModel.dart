import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class TransactionInfoModel  {
  String? responseDescription;
  String? responseCode;
  String? recordCounts;
  List<Result>? result;

  TransactionInfoModel (
      {this.responseDescription,
        this.responseCode,
        this.recordCounts,
        this.result});

  TransactionInfoModel .fromJson(Map<String, dynamic> json) {
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    recordCounts = json['RecordCounts'];
    if (json['Result'] != null && json['Result'] !='[]') {
      // result = new List<Result>();

//      String res = json['Result'].toString().replaceAll('[', '').replaceAll(']', '');
//      List<String> strItems = res.split('<|Split|>');
//      strItems.forEach((element) {
//        result.add(new Result(transactionNumber: getSubStringBetween(element, '<TransactionNumber>', '<-TransactionNumber>'),transactionDate: getSubStringBetween(element, '<TransactionDate>', '<-TransactionDate>'),transactionType: getSubStringBetween(element, '<TransactionType>', '<-TransactionType>')));
//      });

      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(transactionNumber: getSubStringBetween(element, 'TransactionNumber:', ','),transactionDate: getSubStringBetween(element, 'TransactionDate:', ','),transactionType: getSubStringBetween(element, 'TransactionType:', ',')));
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
    data['RecordCounts'] = this.recordCounts;
    if (this.result != null) {
      // data['Result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? transactionNumber;
  String? transactionDate;
  String? transactionType;

  Result({this.transactionNumber, this.transactionDate, this.transactionType});

  Result.fromJson(Map<String, dynamic> json) {
    transactionNumber = json['TransactionNumber'];
    transactionDate = json['TransactionDate'];
    transactionType = json['TransactionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TransactionNumber'] = this.transactionNumber;
    data['TransactionDate'] = this.transactionDate;
    data['TransactionType'] = this.transactionType;
    return data;
  }
}