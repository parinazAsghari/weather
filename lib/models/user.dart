import 'package:emdad_khodro_saipa/models/car.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';
@HiveType(typeId: 1)
class User extends HiveObject{
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.nationalCode,
    this.carList
    });
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? firstName;
  @HiveField(2)
  String? lastName;
  @HiveField(3)
  String? mobileNumber;
  @HiveField(4)
  int? nationalCode;
  @HiveField(5)
  List<Car>? carList;


  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobileNumber = json['mobileNumber'];
    nationalCode = json['nationalCode'];
    carList = json['carList'];

  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['mobileNumber'] = mobileNumber;
    map['nationalCode'] = nationalCode;
    map['carList'] = carList;
    return map;
  }

}