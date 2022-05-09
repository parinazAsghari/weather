

import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class PointTypesModel {
  String? responseDescription;
  String? responseCode;
  List<Result>? result;

  PointTypesModel({this.responseDescription, this.responseCode, this.result});

  PointTypesModel.fromJson(Map<String, dynamic> json) {
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    if (json['Result'] != null && json['Result'] !='[]') {
      // result = new List<Result>();

      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(pointType: getSubStringBetween(element, 'PointType:', ','),points: getSubStringBetween(element, 'Points:', ',')));
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
  String? pointType;
  String? points;

  Result({this.pointType, this.points});

  Result.fromJson(Map<String, dynamic> json) {
    pointType = json['PointType'];
    points = json['Points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PointType'] = this.pointType;
    data['Points'] = this.points;
    return data;
  }
}