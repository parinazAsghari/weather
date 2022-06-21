class SearchAddressResponse {
  int? odataCount;
  List<Value>? value;

  SearchAddressResponse({this.odataCount, this.value});

  SearchAddressResponse.fromJson(Map<String, dynamic> json) {
    odataCount = json['odata.count'];
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(new Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['odata.count'] = this.odataCount;
    if (this.value != null) {
      data['value'] = this.value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Value {
  String? province;
  String? county;
  String? district;
  String? city;
  String? region;
  String? neighborhood;
  String? title;
  String? address;
  String? type;
  String? fclass;
  Geom? geom;

  Value(
      {this.province,
        this.county,
        this.district,
        this.city,
        this.region,
        this.neighborhood,
        this.title,
        this.address,
        this.type,
        this.fclass,
        this.geom});

  Value.fromJson(Map<String, dynamic> json) {
    province = json['province'];
    county = json['county'];
    district = json['district'];
    city = json['city'];
    region = json['region'];
    neighborhood = json['neighborhood'];
    title = json['title'];
    address = json['address'];
    type = json['type'];
    fclass = json['fclass'];
    geom = json['geom'] != null ? new Geom.fromJson(json['geom']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['province'] = this.province;
    data['county'] = this.county;
    data['district'] = this.district;
    data['city'] = this.city;
    data['region'] = this.region;
    data['neighborhood'] = this.neighborhood;
    data['title'] = this.title;
    data['address'] = this.address;
    data['type'] = this.type;
    data['fclass'] = this.fclass;
    if (this.geom != null) {
      data['geom'] = this.geom!.toJson();
    }
    return data;
  }
}

class Geom {
  String? type;
  List<double>? coordinates;

  Geom({this.type, this.coordinates});

  Geom.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}