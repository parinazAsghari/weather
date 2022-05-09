

import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class MemberInfoModel {
  String? responseDescription;
  String? responseCode;
  List<Result>? result;

  MemberInfoModel({this.responseDescription, this.responseCode, this.result});

  MemberInfoModel.fromJson(Map<String, dynamic> json) {
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    if (json['Result'] != null && json['Result'] !='[]') {
      // result = new List<Result>();

//      String res = json['Result'].toString().replaceAll('[', '').replaceAll(']', '');
//      List<String> strItems = res.split('<|Split|>');
//      strItems.forEach((element) {
//        result.add(new Result(memberId: getSubStringBetween(element, '<MemberId>', '<-MemberId>'),programName: getSubStringBetween(element, '<ProgramName>', '<-ProgramName>')));
//      });

      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(memberId: getSubStringBetween(element, 'MemberId:', ','),programName: getSubStringBetween(element, 'ProgramName:', ','),programId: getSubStringBetween(element, 'ProgramId:', ',')));
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
  String? memberId;
  String? programName;
  String? programId;

  Result({this.memberId, this.programName,this.programId});

  Result.fromJson(Map<String, dynamic> json) {
    memberId = json['MemberId'];
    programName = json['ProgramName'];
    programName = json['ProgramId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MemberId'] = this.memberId;
    data['ProgramName'] = this.programName;
    data['ProgramId'] = this.programId;
    return data;
  }
}





/*

 [<transacTionName>nameValue</transactionName> , <transacTionDate>dateValue</transactionDate> <|Split|> <transacTionName>nameValue</transactionName> , <transacTionDate>dateValue</transactionDate>]

*/