import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class TierHistoryModel {
  String? responseDescription;
  String? responseCode;
  List<Result>? result;

  TierHistoryModel({this.responseDescription, this.responseCode, this.result});

  TierHistoryModel.fromJson(Map<String, dynamic> json) {
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    if (json['Result'] != null && json['Result'] !='[]'){
      // result = new List<Result>();

      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(
        //   tierName: getSubStringBetween(element, 'TierName:', ','),
        //   tierClass: getSubStringBetween(element, 'TierClass:', ','),
        //   tierStartDate: getSubStringBetween(element, 'TierStartDate:', ','),
        //   tierEndDate: getSubStringBetween(element, 'TierEndDate:', ','),
        //   active: getSubStringBetween(element, 'Active:', ',')
        // ));
      });

    }
    // result = json['Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseDescription'] = this.responseDescription;
    data['ResponseCode'] = this.responseCode;
    if (this.result != null) {
      // data['Result'] = this.result.map((v) => v.toJson()).toList();
    }    return data;
  }
}
class Result {
  String? tierName;
  String? tierClass;
  String? tierStartDate;
  String? tierEndDate;
  String? active;


  Result(
      {this.tierName,
        this.tierClass,
        this.tierStartDate,
        this.tierEndDate,
        this.active,
      });

  Result.fromJson(Map<String, dynamic> json) {
    tierName = json['TierName'];
    tierClass = json['TierClass'];
    tierStartDate = json['TierStartDate'];
    tierEndDate = json['TierEndDate'];
    active = json['Active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TierName'] = this.tierName;
    data['TierClass'] = this.tierClass;
    data['TierStartDate'] = this.tierStartDate;
    data['TierEndDate'] = this.tierEndDate;
    data['Active'] = this.active;
    return data;
  }
}


// {
// "ResponseDescription": "",
// "ResponseCode": "1",
// "Result":
// "[{
// TierName:پنج,
// TierClass:رده ها,
// TierStartDate:1399/2/16 12:30:0,
// TierEndDate:1400/2/15 12:29:59,
// Active:Y
// },
// {TierName:صفر,TierClass:رده ها,TierStartDate:1399/2/15 12:30:0,TierEndDate:1399/2/16 12:29:59,Active:N},]"
// }