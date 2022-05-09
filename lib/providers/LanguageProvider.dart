
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/Consts.dart';
import 'package:loyalty_app/utils/SharedPrefsUtil.dart';

class LanguageProvider extends ChangeNotifier {

  Locale _appLocale = Locale('fa');
  Locale get getAppLocal => _appLocale ?? Locale("fa");

  fetchLocale() async {
    String localeName = await SharedPrefsUtil.prefsInstance.loadLocaleNameFromPref();
    _appLocale = Locale(localeName);
    print('$LogTag ${_appLocale.languageCode}');
    return Null;
  }

  void changeLanguage(String localName) async {

    if (_appLocale.languageCode == localName) {
      return;
    }

    await SharedPrefsUtil.prefsInstance.saveLocaleNameToPref(localeName: '$localName');
    _appLocale = Locale('$localName');
    notifyListeners();
  }

}