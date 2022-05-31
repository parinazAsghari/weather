import 'package:hive_flutter/hive_flutter.dart';
part 'car.g.dart';

@HiveType(typeId: 2)
class Car  extends HiveObject{
  Car({
    this.id,
    this.brand,
    this.chassisNumber,
    this.createDate,
    this.firstCarTag,
    this.fourthCarTag,
    this.ownerNationalCode,
    this.secondCarTag,
    this.thirdCarTag
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? chassisNumber;
  @HiveField(2)
  String? ownerNationalCode;
  @HiveField(3)
  String? brand;
  @HiveField(4)
  String? createDate;
  @HiveField(5)
  int? firstCarTag;
  @HiveField(6)
  String? secondCarTag;
  @HiveField(7)
  int? thirdCarTag;
  @HiveField(8)
  int? fourthCarTag;


  Car.fromJson(dynamic json) {
    id = json['id'];
    chassisNumber = json['chassisNumber'];
    ownerNationalCode = json['ownerNationalCode'];
    createDate = json['createDate'];
    brand = json['brand'];
    firstCarTag = json['firstCarTag'];
    secondCarTag = json['secondCarTag'];
    thirdCarTag = json['thirdCarTag'];
    fourthCarTag = json['fourthCarTag'];

  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['chassisNumber'] = chassisNumber;
    map['ownerNationalCode'] = ownerNationalCode;
    map['createDate'] = createDate;
    map['brand'] = brand;
    map['firstCarTag'] = firstCarTag;
    map['secondCarTag'] = secondCarTag;
    map['thirdCarTag'] = thirdCarTag;
    map['fourthCarTag'] = fourthCarTag;
    return map;
  }

}