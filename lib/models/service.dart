import 'package:hive_flutter/hive_flutter.dart';

part 'service.g.dart';

@HiveType(typeId: 3)
class Service extends HiveObject {
  Service({this.id, this.serviceName, this.iconPath, this.isFavorite, this.isFixed, this.slideId, this.onTap});

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? serviceName;
  @HiveField(2)
  String? iconPath;
  @HiveField(3)
  bool? isFavorite;
  @HiveField(4)
  bool? isFixed;
  @HiveField(5)
  int? slideId;
  Function()? onTap;
}
