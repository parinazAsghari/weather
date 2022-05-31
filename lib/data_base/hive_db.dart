import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
//this class defines hive database methods
class HiveDB {
  late Box box;

  //if you want create secure db pass isSecure true and a storage key.
  _createHiveBox( String boxName,) async {
      box = await Hive.openBox(boxName);
      return box;
  }

  Future<List> getData(dynamic key, String boxName, {dynamic defaultValue}) async {
    var box;
    bool boxExists = Hive.isBoxOpen(boxName);
    if (boxExists) {
      box = Hive.box(boxName);
    } else {
      box = await _createHiveBox( boxName,);
    }
    // box.values.forEach((element) {print(element.brand);});
    return box.values.toList();
      // (key, defaultValue: defaultValue);
  }
  putData(dynamic dataKey, String boxName, dynamic value,) async {
    var box;
    bool boxExists = await Hive.isBoxOpen(boxName);

    if (boxExists) {
      box = Hive.box(boxName);
    } else {
      box = await _createHiveBox(boxName,);
    }
    box.put(dataKey, value);
  }
  deleteData(dynamic key, String boxName,) async {
    var box;
    bool boxExists = await Hive.boxExists(boxName);
    if (boxExists) {
      box = Hive.box(boxName);
    } else {
      box = await _createHiveBox(boxName,);
    }

    box.delete(key);
  }

  addData(dynamic value, String boxName,) async {
    var box;
    bool boxExists = Hive.isBoxOpen(boxName);
    if (boxExists) {
      box = Hive.box(boxName);
    } else {
      box = await _createHiveBox( boxName,);
    }
    box.add(value);
  }
}
