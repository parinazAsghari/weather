import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/utils/SharedPrefsUtil.dart';
import 'package:loyalty_app/utils/ThemeManagerModule.dart';

class ThemeProvider with ChangeNotifier {

  ThemeData _themeData ;
  String _themeName;

  ThemeData get getThemeData => _themeData;
  String get getThemeName => _themeName;

  fetchTheme()async{
    String themeName = await SharedPrefsUtil.prefsInstance.loadThemeNameFromPref();
    _themeData = ThemeManagerModule.themeManagerModule.getThemeByName(themeName);
    _themeName = themeName;
    return Null;
  }

  void changeTheme(String themeName)async{
    SharedPrefsUtil.prefsInstance.saveThemeNameToPref(themeName: themeName);
    _themeData = ThemeManagerModule.themeManagerModule.getThemeByName(themeName);
    _themeName = themeName;
    notifyListeners();
  }


}