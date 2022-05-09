import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/utils/SharedPrefsUtil.dart';

class LoginProvider with ChangeNotifier {

  bool _rememberMe = false;
  bool _useBiometric = false;
  String _userName = '';
  String _passWord = '';

  LoginProvider(){
    loadRememberMe();
    loadUserPass();
    loadUseBiometric();
  }


  bool get getUseBiometric => _useBiometric;

  set setUseBiometric(bool value) {
    _useBiometric = value;
    notifyListeners();
  }


  bool get getRememberMe => _rememberMe;

  set setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }


  String get getUserName => _userName;

  set setUserName(String value) {
    _userName = value;
  }


  String get getPassWord => _passWord;

  set setPassWord(String value) {
    _passWord = value;
  }

  void loadRememberMe()async{
    _rememberMe = await SharedPrefsUtil.prefsInstance.loadBoolFromPref('RememberMe') ?? false;
    notifyListeners();
  }

  void saveRememberMe()async{
    await SharedPrefsUtil.prefsInstance.saveBoolToPrefs('RememberMe', _rememberMe);
  }

  void loadUserPass()async{
    _userName = await SharedPrefsUtil.prefsInstance.loadStringFromPref('UserName') ?? '';
    _passWord = await SharedPrefsUtil.prefsInstance.loadStringFromPref('PassWord') ?? '';
    notifyListeners();
  }

  void saveUserPass()async{
    await SharedPrefsUtil.prefsInstance.saveStringToPrefs('UserName', _userName);
    await SharedPrefsUtil.prefsInstance.saveStringToPrefs('PassWord', _passWord);
  }


  void loadUseBiometric ()async {

    bool isBiometric = await SharedPrefsUtil.prefsInstance.loadBoolFromPref('UseBiometric') ?? false;
    this._useBiometric = isBiometric;
    notifyListeners();

  }


}