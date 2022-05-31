
class AddressRequest {
  String? address;
  String? postalAddress;
  String? addressCompact;
  String? primary;
  String? name;
  String? poi;
  String? country;
  String? province;
  String? county;
  String? district;
  String? ruralDistrict;
  String? city;
  String? village;
  String? region;
  String? neighbourhood;
  String? last;
  String? plaque;
  String? postalCode;
  Geom? geom;

  AddressRequest(
      {this.address,
        this.postalAddress,
        this.addressCompact,
        this.primary,
        this.name,
        this.poi,
        this.country,
        this.province,
        this.county,
        this.district,
        this.ruralDistrict,
        this.city,
        this.village,
        this.region,
        this.neighbourhood,
        this.last,
        this.plaque,
        this.postalCode,
        this.geom});

  AddressRequest.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    postalAddress = json['postal_address'];
    addressCompact = json['address_compact'];
    primary = json['primary'];
    name = json['name'];
    poi = json['poi'];
    country = json['country'];
    province = json['province'];
    county = json['county'];
    district = json['district'];
    ruralDistrict = json['rural_district'];
    city = json['city'];
    village = json['village'];
    region = json['region'];
    neighbourhood = json['neighbourhood'];
    last = json['last'];
    plaque = json['plaque'];
    postalCode = json['postal_code'];
    geom = json['geom'] != null ? new Geom.fromJson(json['geom']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['postal_address'] = this.postalAddress;
    data['address_compact'] = this.addressCompact;
    data['primary'] = this.primary;
    data['name'] = this.name;
    data['poi'] = this.poi;
    data['country'] = this.country;
    data['province'] = this.province;
    data['county'] = this.county;
    data['district'] = this.district;
    data['rural_district'] = this.ruralDistrict;
    data['city'] = this.city;
    data['village'] = this.village;
    data['region'] = this.region;
    data['neighbourhood'] = this.neighbourhood;
    data['last'] = this.last;
    data['plaque'] = this.plaque;
    data['postal_code'] = this.postalCode;
    if (this.geom != null) {
      data['geom'] = this.geom!.toJson();
    }
    return data;
  }
}

class Geom {
  String? type;
  List<String>? coordinates;

  Geom({this.type, this.coordinates});

  Geom.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}