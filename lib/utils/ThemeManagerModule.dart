import 'package:flutter/material.dart';
import 'Colors.dart';
import 'Consts.dart';
import 'SharedPrefsUtil.dart';

class ThemeManagerModule {

  ThemeData _inUseTheme = ThemeData(
    primaryColor: Colors.white,
    accentColor: Colors.white,
  );

  ThemeData _themeA = ThemeData(
    backgroundColor: backgroundColorThemeA,
    primarySwatch: materialColorThemeA,
    primaryColor: primaryColorThemeA,
    primaryColorDark: primaryDarkColorThemeA,
    primaryColorLight: primaryLightColorThemeA,
    accentColor: accentColorThemeA,
    buttonColor: accentColorThemeA,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColorThemeA,
      foregroundColor: accentColorThemeA
    ),
    unselectedWidgetColor: color_grey_darker,
    indicatorColor: accentColorThemeA,
    appBarTheme: AppBarTheme(
        color: primaryColorThemeA,
        iconTheme: IconThemeData(color: primaryColorThemeA),
        textTheme: TextTheme(headline6: TextStyle(color: primaryColorThemeA,fontSize: 18.0))
    ),
    cardColor: cardColorThemeA,
    textTheme: _textThemeA,
  );

  ThemeData _themeB = ThemeData(
      backgroundColor: backgroundColorThemeB,
      primarySwatch: materialColorThemeB,
      primaryColor: primaryColorThemeB,
      primaryColorDark: primaryDarkColorThemeB,
      primaryColorLight: primaryLightColorThemeB,
      accentColor: accentColorThemeB,
      buttonColor: accentColorThemeB,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColorThemeB,
          foregroundColor: accentColorThemeB
      ),
      unselectedWidgetColor: color_grey_darker,
      indicatorColor: accentColorThemeB,
      appBarTheme: AppBarTheme(
          color: primaryColorThemeB,
          iconTheme: IconThemeData(color: primaryColorThemeB),
          textTheme: TextTheme(headline6: TextStyle(color: primaryColorThemeB,fontSize: 18.0))
      ),
      cardColor: cardColorThemeB,
      textTheme: _textThemeB
  );

  ThemeData _themeC = ThemeData(
      backgroundColor: backgroundColorThemeC,
      primarySwatch: materialColorThemeC,
      primaryColor: primaryColorThemeC,
      primaryColorDark: primaryDarkColorThemeC,
      primaryColorLight: primaryLightColorThemeC,
      accentColor: accentColorThemeC,
      buttonColor: accentColorThemeC,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColorThemeC,
          foregroundColor: accentColorThemeC
      ),
      unselectedWidgetColor: color_grey_darker,
      indicatorColor: accentColorThemeC,
      appBarTheme: AppBarTheme(
          color: primaryColorThemeC,
          iconTheme: IconThemeData(color: accentColorThemeC),
          textTheme: TextTheme(headline6: TextStyle(color: accentColorThemeC,fontSize: 18.0))
      ),
      cardColor: cardColorThemeC,
      textTheme: _textThemeC
  );

  ThemeData _themeSkyBlue = ThemeData(

      backgroundColor: backgroundColorThemeSkyBlue,
      primarySwatch: materialColorThemeSkyBlue,
      primaryColor: primaryColorThemeSkyBlue,
      primaryColorDark: primaryDarkColorThemeSkyBlue,
      primaryColorLight: primaryLightColorThemeSkyBlue,
      accentColor: accentColorThemeSkyBlue,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColorThemeSkyBlue,
          foregroundColor: accentColorThemeSkyBlue
      ),


      buttonColor: accentColorThemeSkyBlue,
      unselectedWidgetColor: color_grey_darker,
      indicatorColor: accentLightColorThemeSkyBlue,
      appBarTheme: AppBarTheme(
          color: primaryColorThemeSkyBlue,
          iconTheme: IconThemeData(color: primaryColorThemeSkyBlue),
          textTheme: TextTheme(headline6: TextStyle(color: primaryColorThemeSkyBlue,fontSize: 18.0))
      ),
      cardColor: cardColorThemeSkyBlue,
      textTheme: _textThemeSkyBlue
  );

  ThemeData _themeNavyBlue = ThemeData(

      backgroundColor: backgroundColorThemeNavyBlue,
      primarySwatch: materialColorThemeNavyBlue,
      primaryColor: primaryColorThemeNavyBlue,
      primaryColorDark: primaryDarkColorThemeNavyBlue,
      primaryColorLight: primaryLightColorThemeNavyBlue,
      accentColor: accentColorThemeNavyBlue,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColorThemeNavyBlue,
          foregroundColor: accentColorThemeNavyBlue
      ),


      buttonColor: accentColorThemeNavyBlue,
      unselectedWidgetColor: color_grey_darker,
      indicatorColor: accentLightColorThemeNavyBlue,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(headline6: TextStyle(color: Colors.white,fontSize: 18.0))
      ),
      cardColor: cardColorThemeNavyBlue,
      textTheme: _textThemeNavyBlue
  );

  ThemeData _themeGoldBlue = ThemeData(

      backgroundColor: backgroundColorThemeGoldBlue,
      primarySwatch: materialColorThemeGoldBlue,
      primaryColor: primaryColorThemeGoldBlue,
      primaryColorDark: primaryDarkColorThemeGoldBlue,
      primaryColorLight: primaryLightColorThemeGoldBlue,
      accentColor: accentColorThemeGoldBlue,
      shadowColor: buttonGoldColorThemeGoldBlue,
      secondaryHeaderColor: buttonGrayColorThemeGoldBlue,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColorThemeGoldBlue,
          foregroundColor: accentColorThemeGoldBlue
      ),


      buttonColor: accentColorThemeGoldBlue,
      unselectedWidgetColor: color_grey_darker,
      indicatorColor: accentLightColorThemeGoldBlue,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(headline6: TextStyle(color: Colors.white,fontSize: 18.0))
      ),
      cardColor: cardColorThemeGoldBlue,
      textTheme: _textThemeGoldBlue
  );

  ThemeData _themeWhiteBlue = ThemeData(

      backgroundColor: backgroundColorThemeWhiteBlue,
      primarySwatch: materialColorThemeWhiteBlue,
      primaryColor: primaryColorThemeWhiteBlue,
      primaryColorDark: primaryDarkColorThemeWhiteBlue,
      primaryColorLight: primaryLightColorThemeWhiteBlue,
      accentColor: accentColorThemeWhiteBlue,
      shadowColor: buttonGoldColorThemeWhiteBlue,
      secondaryHeaderColor: buttonGrayColorThemeWhiteBlue,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColorThemeWhiteBlue,
          foregroundColor: accentColorThemeWhiteBlue
      ),


      buttonColor: accentColorThemeWhiteBlue,
      unselectedWidgetColor: color_grey_darker,
      indicatorColor: accentLightColorThemeWhiteBlue,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(headline6: TextStyle(color: Colors.white,fontSize: 18.0))
      ),
      cardColor: cardColorThemeWhiteBlue,
      textTheme: _textThemeWhiteBlue
  );




  ThemeManagerModule._(){
    initTheme();
  }


  static final ThemeManagerModule themeManagerModule = ThemeManagerModule._();


  void initTheme() async {

    String themeName = await SharedPrefsUtil.prefsInstance.loadThemeNameFromPref();

    print('$LogTag $themeName');

    if(themeName=="themeA"){
      _inUseTheme = _themeA;
    }
    else if (themeName=="themeB"){
      _inUseTheme = _themeB;
    }
    else if (themeName=="themeC"){
      _inUseTheme = _themeC;
    }
    else if (themeName == "themeSkyBlue"){
      _inUseTheme = _themeSkyBlue;
    }
    else if (themeName == "themeNavyBlue"){
      _inUseTheme = _themeNavyBlue;
    }
    else if (themeName == "themeGoldBlue"){
      _inUseTheme = _themeGoldBlue;
    }
    else if (themeName == "themeWhiteBlue"){
      _inUseTheme = _themeWhiteBlue;
    }

    else{
      _inUseTheme = _themeA;
    }
    print("$LogTag => theme name is : $themeName");

  }


  ThemeData getThemeByName(String themeName) {
    if(themeName=="themeA"){
      return _themeA;
    }
    else if (themeName=="themeB"){
      return _themeB;
    }
    else if (themeName=="themeC"){
      return _themeC;
    }
    else if (themeName == "themeSkyBlue"){
      return _themeSkyBlue;
    }
    else if (themeName == "themeNavyBlue"){
      return _themeNavyBlue;
    }
    else if (themeName == "themeGoldBlue"){
     return _themeGoldBlue;
    }
    else if (themeName == "themeWhiteBlue"){
     return _themeWhiteBlue;
    }
    else{
      return _themeA;
    }
  }

  String getThemeName() {
    if(_inUseTheme==_themeA){
      return 'theme A';
    }
    else if (_inUseTheme==_themeB){
      return 'theme B';
    }
    else if (_inUseTheme==_themeC){
      return 'theme C';
    }
    else if(_inUseTheme == _themeSkyBlue){
      return 'theme SkyBlue';
    }
    else if(_inUseTheme == _themeNavyBlue){
      return 'theme NavyBlue';
    }
    else if(_inUseTheme == _themeGoldBlue){
      return 'theme GoldBlue';
    }
    else if(_inUseTheme == _themeWhiteBlue){
      return 'theme WhiteBlue';
    }
    else{
      return 'theme N/A';
    }
  }

  void setTheme(String themeNameval) async {
    SharedPrefsUtil.prefsInstance.saveThemeNameToPref(themeName: themeNameval);
    initTheme();
  }


  ThemeData get getInUseTheme => _inUseTheme;

}










final TextTheme _textThemeA = TextTheme(
  bodyText1: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  bodyText2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  button: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  caption: TextStyle(color: color_font_grey_dark, fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline1: TextStyle(color: color_font_grey_dark, fontSize: 34.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline2: TextStyle(color: color_font_grey_dark, fontSize: 45.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline3: TextStyle(color: color_font_grey_dark, fontSize: 56.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline4: TextStyle(color: color_font_grey_dark, fontSize: 112.0, fontWeight: FontWeight.w100, fontFamily: 'Iranian'),
  headline5: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  overline: TextStyle(color: color_font_grey_dark, fontSize: 10.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle1: TextStyle(color: color_font_grey_dark, fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  headline6: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
);


final TextTheme _textThemeB = TextTheme(
  bodyText1: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  bodyText2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  button: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  caption: TextStyle(color: color_font_grey_dark, fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline1: TextStyle(color: color_font_grey_dark, fontSize: 34.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline2: TextStyle(color: color_font_grey_dark, fontSize: 45.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline3: TextStyle(color: color_font_grey_dark, fontSize: 56.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline4: TextStyle(color: color_font_grey_dark, fontSize: 112.0, fontWeight: FontWeight.w100, fontFamily: 'Iranian'),
  headline5: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  overline: TextStyle(color: color_font_grey_dark, fontSize: 10.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle1: TextStyle(color: color_font_grey_dark, fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  headline6: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
);


final TextTheme _textThemeC = TextTheme(
  bodyText1: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  bodyText2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  button: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  caption: TextStyle(color: color_font_grey_dark, fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline1: TextStyle(color: color_font_grey_dark, fontSize: 34.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline2: TextStyle(color: color_font_grey_dark, fontSize: 45.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline3: TextStyle(color: color_font_grey_dark, fontSize: 56.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline4: TextStyle(color: color_font_grey_dark, fontSize: 112.0, fontWeight: FontWeight.w100, fontFamily: 'Iranian'),
  headline5: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  overline: TextStyle(color: color_font_grey_dark, fontSize: 10.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle1: TextStyle(color: color_font_grey_dark, fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  headline6: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
);

final TextTheme _textThemeSkyBlue = TextTheme(
  bodyText1: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  bodyText2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  button: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  caption: TextStyle(color: color_font_grey_dark, fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline1: TextStyle(color: color_font_grey_dark, fontSize: 34.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline2: TextStyle(color: color_font_grey_dark, fontSize: 45.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline3: TextStyle(color: color_font_grey_dark, fontSize: 56.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline4: TextStyle(color: color_font_grey_dark, fontSize: 112.0, fontWeight: FontWeight.w100, fontFamily: 'Iranian'),
  headline5: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  overline: TextStyle(color: color_font_grey_dark, fontSize: 10.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle1: TextStyle(color: color_font_grey_dark, fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  headline6: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
);

final TextTheme _textThemeNavyBlue = TextTheme(
  bodyText1: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  bodyText2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  button: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  caption: TextStyle(color: color_font_grey_dark, fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline1: TextStyle(color: color_font_grey_dark, fontSize: 34.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline2: TextStyle(color: color_font_grey_dark, fontSize: 45.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline3: TextStyle(color: color_font_grey_dark, fontSize: 56.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline4: TextStyle(color: color_font_grey_dark, fontSize: 112.0, fontWeight: FontWeight.w100, fontFamily: 'Iranian'),
  headline5: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  overline: TextStyle(color: color_font_grey_dark, fontSize: 10.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle1: TextStyle(color: color_font_grey_dark, fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  headline6: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
);


final TextTheme _textThemeGoldBlue = TextTheme(
  bodyText1: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  bodyText2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  button: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  caption: TextStyle(color: color_font_grey_dark, fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline1: TextStyle(color: color_font_grey_dark, fontSize: 34.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline2: TextStyle(color: color_font_grey_dark, fontSize: 45.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline3: TextStyle(color: color_font_grey_dark, fontSize: 56.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline4: TextStyle(color: color_font_grey_dark, fontSize: 112.0, fontWeight: FontWeight.w100, fontFamily: 'Iranian'),
  headline5: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  overline: TextStyle(color: color_font_grey_dark, fontSize: 10.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle1: TextStyle(color: color_font_grey_dark, fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  headline6: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
);

final TextTheme _textThemeWhiteBlue = TextTheme(
  bodyText1: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  bodyText2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  button: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  caption: TextStyle(color: color_font_grey_dark, fontSize: 12.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline1: TextStyle(color: color_font_grey_dark, fontSize: 34.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline2: TextStyle(color: color_font_grey_dark, fontSize: 45.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline3: TextStyle(color: color_font_grey_dark, fontSize: 56.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  headline4: TextStyle(color: color_font_grey_dark, fontSize: 112.0, fontWeight: FontWeight.w100, fontFamily: 'Iranian'),
  headline5: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  overline: TextStyle(color: color_font_grey_dark, fontSize: 10.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle1: TextStyle(color: color_font_grey_dark, fontSize: 16.0, fontWeight: FontWeight.w400, fontFamily: 'Iranian'),
  subtitle2: TextStyle(color: color_font_grey_dark, fontSize: 14.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
  headline6: TextStyle(color: color_font_grey_dark, fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'Iranian'),
);
