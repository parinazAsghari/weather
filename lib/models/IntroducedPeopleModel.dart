import 'package:emdad_khodro_saipa/utils/CommonUtils.dart';

class IntroducedPeopleModel {
  String? responseDescription;
  String? responseCode;
  List<Result>? result;

  IntroducedPeopleModel(
      {this.responseDescription, this.responseCode, this.result});

  IntroducedPeopleModel.fromJson(Map<String, dynamic> json) {
    responseDescription = json['ResponseDescription'];
    responseCode = json['ResponseCode'];
    if (json['Result'] != null && json['Result'] !='[]' && json['Result'] != '') {
      // result = new List<Result>();

      String res = json['Result'].toString().replaceAll('[{', '').replaceAll('},]', ',').replaceAll('},{', ',},{');
      List<String> strItems = res.split('},{');
      strItems.forEach((element) {
        // result.add(new Result(firstName: getSubStringBetween(element, 'FirstName:', ','),middleName: getSubStringBetween(element, 'MiddleName:', ','),lastName: getSubStringBetween(element, 'LastName:', ','),nameTitle: getSubStringBetween(element, 'NameTitle:', ','),emailAddress: getSubStringBetween(element, 'EmailAddress:', ','),comment: getSubStringBetween(element, 'Comment:', ',')));
      });

//      json['Result'].forEach((v) {
//        result.add(new Result.fromJson(v));
//      });

    }
    else if(json['Result'] =='[]'){
      // result = new List<Result>();
    }
    else{
      result = null;
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
  String? firstName;
  String? middleName;
  String? lastName;
  String? nameTitle;
  String? emailAddress;
  String? comment;

  Result(
      {this.firstName,
        this.middleName,
        this.lastName,
        this.nameTitle,
        this.emailAddress,
        this.comment});

  Result.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    nameTitle = json['NameTitle'];
    emailAddress = json['EmailAddress'];
    comment = json['Comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FirstName'] = this.firstName;
    data['MiddleName'] = this.middleName;
    data['LastName'] = this.lastName;
    data['NameTitle'] = this.nameTitle;
    data['EmailAddress'] = this.emailAddress;
    data['Comment'] = this.comment;
    return data;
  }
}