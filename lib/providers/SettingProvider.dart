import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/utils/SharedPrefsUtil.dart';

class SettingProvider with ChangeNotifier {

  bool _useBiometric = false;

  bool get getUseBiometric => _useBiometric;

  set setUseBiometric(bool value) {
    _useBiometric = value;
    notifyListeners();
  }


  void loadUseBiometric ()async {

    bool isBiometric = await SharedPrefsUtil.prefsInstance.loadBoolFromPref('UseBiometric') ?? false;
    this._useBiometric = isBiometric;
    notifyListeners();

  }

  void saveUseBiometric() async {
    await SharedPrefsUtil.prefsInstance.saveBoolToPrefs('UseBiometric', _useBiometric);
  }


}