import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class PromotionsModel {
  String? responseDescription;
  String? responseCode;
  List<Result>? result;

  PromotionsModel({this.responseDescription, this.responseCode, this.result});

  PromotionsModel.fromJson(Map<String, dynamic> json) {
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    if (json['Result'] != null && json['Result'] !='[]') {
      // result = new List<Result>();


      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(promotionNumber: getSubStringBetween(element, 'PromotionNumber:', ','),name: getSubStringBetween(element, 'Name:', ','),startDate: getSubStringBetween(element, 'StartDate:', ','),endDate: getSubStringBetween(element, 'EndDate:', ','),description: getSubStringBetween(element, 'Description:', ',')));
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
  String? promotionNumber;
  String? name;
  String? startDate;
  String? endDate;
  String? description;

  Result(
      {this.promotionNumber,
        this.name,
        this.startDate,
        this.endDate,
        this.description});

  Result.fromJson(Map<String, dynamic> json) {
    promotionNumber = json['PromotionNumber'];
    name = json['Name'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PromotionNumber'] = this.promotionNumber;
    data['Name'] = this.name;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['Description'] = this.description;
    return data;
  }
}