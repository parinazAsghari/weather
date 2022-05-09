
class UserIPModel {
  String? ip;
  String? country;
  String? cc;

  UserIPModel({this.ip, this.country, this.cc});

  UserIPModel.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    country = json['country'];
    cc = json['cc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip'] = this.ip;
    data['country'] = this.country;
    data['cc'] = this.cc;
    return data;
  }
}






