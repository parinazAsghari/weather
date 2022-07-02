class GetTimeTable {
  int? resultCode;
  Data? data;
  List<String>? failures;

  GetTimeTable({this.resultCode, this.data, this.failures});

  GetTimeTable.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    failures = json['failures'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCode'] = this.resultCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['failures'] = this.failures;
    return data;
  }
}

class Data {
  List<Items>? items;

  Data({this.items});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? persianDate;
  String? persianDateText;
  String? time;

  Items({this.persianDate, this.persianDateText, this.time});

  Items.fromJson(Map<String, dynamic> json) {
    persianDate = json['persianDate'];
    persianDateText = json['persianDateText'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['persianDate'] = this.persianDate;
    data['persianDateText'] = this.persianDateText;
    data['time'] = this.time;
    return data;
  }
}