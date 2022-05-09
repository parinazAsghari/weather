import 'dart:collection';
import 'dart:convert';
import 'dart:io';
// import 'package:convert/convert.dart';
// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:intl/intl.dart';

import 'Colors.dart';




int convertBooleanToInt(bool value){
    int result;

    if (value){
      result = 1;
    }
    else{
      result = 0;
    }
   return result;
}

bool convertIntToBool(int value){
    bool result;
    if (value==1){
      result = true;
    }
    else{
      result = false;
    }
    return result;
}


bool convertStringToBool (String value){

    bool result;
    if(value.toLowerCase()=="true"){
      result=true;
    }
    else{
      result=false;
    }

    return result;
}


String convertBoolToString (bool value){

  String result;
  if(value=="true"){
    result="true";
  }
  else{
    result="false";
  }

  return result;
}



void hideKeyboard () {
  //FocusScope.of(context).requestFocus(new FocusNode());
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}


void hideKeyboardFocus (BuildContext ctx) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  FocusScope.of(ctx).requestFocus(new FocusNode());
}


//get substring between 2 word
String getSubStringBetween(String mainStr,String startStr,String endStr){
  String result;
    try{
      final startIndex = mainStr.indexOf(startStr);
      final endIndex = mainStr.indexOf(endStr, startIndex + startStr.length);
      result = mainStr.substring(startIndex + startStr.length, endIndex);
    }
    catch (exc) {
      result = "-";
    }

  return result;
}



//get substring after a last specific word
// String subStringAfterLastWord(String mainStr,String wordStr){
//   String result;
//   try{
//     mainStr.substring(mainStr.lastIndexOf("$wordStr")+1);
//   }
//   catch (exc) {
//     result = "-";
//   }
//
//   return result;
// }




//file size converter method
String fileSizeWithSuffix(dynamic size, [int round = 2]) {
  /**
   * this is orginal method
   * [size] can be passed as number or as string
   *
   * the optional parameter [round] specifies the number
   * of digits after comma/point (default is 2)
   */
  int divider = 1024;
  int _size;
  try {
    _size = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError("Can not parse the size parameter: $e");
  }

  if (_size < divider) {
    return "$_size B";
  }

  if (_size < divider * divider && _size % divider == 0) {
    return "${(_size / divider).toStringAsFixed(0)} KB";
  }

  if (_size < divider * divider) {
    return "${(_size / divider).toStringAsFixed(round)} KB";
  }

  if (_size < divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider)).toStringAsFixed(0)} MB";
  }

  if (_size < divider * divider * divider) {
    return "${(_size / divider / divider).toStringAsFixed(round)} MB";
  }

  if (_size < divider * divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider * divider)).toStringAsFixed(0)} GB";
  }

  if (_size < divider * divider * divider * divider) {
    return "${(_size / divider / divider / divider).toStringAsFixed(round)} GB";
  }

  if (_size < divider * divider * divider * divider * divider &&
      _size % divider == 0) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} TB";
  }

  if (_size < divider * divider * divider * divider * divider) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} TB";
  }

  if (_size < divider * divider * divider * divider * divider * divider &&
      _size % divider == 0) {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} PB";
  } else {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} PB";
  }
}//orginall

String getfileSizeWithSuffix(int size, [int round = 2]) {
  /**
   * [size] can be passed as number or as string
   *
   * the optional parameter [round] specifies the number
   * of digits after comma/point (default is 2)
   */
  int divider = 1024;
  int _size;
  try {
    _size = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError("Can not parse the size parameter: $e");
  }

  if (_size < divider) {
    return "$_size B";
  }

  if (_size < divider * divider && _size % divider == 0) {
    return "${(_size / divider).toStringAsFixed(0)} KB";
  }

  if (_size < divider * divider) {
    return "${(_size / divider).toStringAsFixed(round)} KB";
  }

  if (_size < divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider)).toStringAsFixed(0)} MB";
  }

  if (_size < divider * divider * divider) {
    return "${(_size / divider / divider).toStringAsFixed(round)} MB";
  }

  if (_size < divider * divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider * divider)).toStringAsFixed(0)} GB";
  }

  if (_size < divider * divider * divider * divider) {
    return "${(_size / divider / divider / divider).toStringAsFixed(round)} GB";
  }

  if (_size < divider * divider * divider * divider * divider &&
      _size % divider == 0) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} TB";
  }

  if (_size < divider * divider * divider * divider * divider) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} TB";
  }

  if (_size < divider * divider * divider * divider * divider * divider &&
      _size % divider == 0) {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)} PB";
  } else {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)} PB";
  }
}

String getfileSizeWithType(int size, [int round = 2]) {
  /**
   * //this will recognize unit type & will return different size like kb mb gb just in numeric digit and without suffix
   * [size] can be passed as number or as string
   *
   * the optional parameter [round] specifies the number
   * of digits after comma/point (default is 2)
   */
  int divider = 1024;
  int _size;
  try {
    _size = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError("Can not parse the size parameter: $e");
  }

  if (_size < divider) {
    return "$_size";
  }

  if (_size < divider * divider && _size % divider == 0) {
    return "${(_size / divider).toStringAsFixed(0)}";
  }

  if (_size < divider * divider) {
    return "${(_size / divider).toStringAsFixed(round)}";
  }

  if (_size < divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider)).toStringAsFixed(0)}";
  }

  if (_size < divider * divider * divider) {
    return "${(_size / divider / divider).toStringAsFixed(round)}";
  }

  if (_size < divider * divider * divider * divider && _size % divider == 0) {
    return "${(_size / (divider * divider * divider)).toStringAsFixed(0)}";
  }

  if (_size < divider * divider * divider * divider) {
    return "${(_size / divider / divider / divider).toStringAsFixed(round)}";
  }

  if (_size < divider * divider * divider * divider * divider &&
      _size % divider == 0) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)}";
  }

  if (_size < divider * divider * divider * divider * divider) {
    num r = _size / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)}";
  }

  if (_size < divider * divider * divider * divider * divider * divider &&
      _size % divider == 0) {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(0)}";
  } else {
    num r = _size / divider / divider / divider / divider / divider;
    return "${r.toStringAsFixed(round)}";
  }
}

String getFileSizeUnit(int size, [int round = 2]) {
  /**
   * [size] can be passed as number or as string
   *
   * the optional parameter [round] specifies the number
   * of digits after comma/point (default is 2)
   */
  int divider = 1024;
  int _size;
  try {
    _size = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError("Can not parse the size parameter: $e");
  }

  if (_size < divider) {
    return "B";
  }

  if (_size < divider * divider && _size % divider == 0) {
    return "KB";
  }

  if (_size < divider * divider) {
    return "KB";
  }

  if (_size < divider * divider * divider && _size % divider == 0) {
    return "MB";
  }

  if (_size < divider * divider * divider) {
    return "MB";
  }

  if (_size < divider * divider * divider * divider && _size % divider == 0) {
    return "GB";
  }

  if (_size < divider * divider * divider * divider) {
    return "GB";
  }

  if (_size < divider * divider * divider * divider * divider &&
      _size % divider == 0) {
    return "TB";
  }

  if (_size < divider * divider * divider * divider * divider) {
    return "TB";
  }

  if (_size < divider * divider * divider * divider * divider * divider &&
      _size % divider == 0) {
    return "PB";
  } else {
    return "PB";
  }
}

double getFileSizeInKB(int size , [int round = 2]){

  int divider = 1024;
  int _size;

  try {
    _size = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError("Can not parse the size parameter: $e");
  }


  if (_size % divider == 0) {
    return double.parse((_size / divider).toStringAsFixed(0));
  }

  else{
    return double.parse((_size / divider).toStringAsFixed(round));
  }


}

double getFileSizeInMB(int size , [int round = 2]){

  int divider = 1024;
  int _size;

  try {
    _size = int.parse(size.toString());
  } catch (e) {
    throw ArgumentError("Can not parse the size parameter: $e");
  }


  if (_size % divider == 0) {
    return double.parse((_size / (divider * divider)).toStringAsFixed(0));
  }

  else{
    return double.parse((_size / divider / divider).toStringAsFixed(round));
  }

}


//----------------------------- convert file to base64 -------------------------

// String convertFileToBase64(File attachedFile){
//
//   if (attachedFile==null){
//     return null;
//   }
//   else{
//
//     List<int> fileBytes = attachedFile.readAsBytesSync();
//     String base64File = base64.encode(fileBytes);
//     return base64File;
//   }
// }





//----------------------------- convert date to string -------------------------


// DateTime convertStringToDate(String dateValue){
//
//   try{
//     DateTime dateTime = DateTime.now();
//
//     dateTime =  DateFormat("yyyy-MM-dd").parse(dateValue) ?? dateTime;
//
//     return dateTime;
//   }
//   catch(exc){
//     return null;
//   }
//
// }

TimeOfDay convertStringToTimeOfDay(String dateValue){


   try{
     DateTime dateTime = DateTime.now();
     dateTime =  DateFormat("yyyy-MM-ddTHH:mm").parse(dateValue) ?? dateTime;
     TimeOfDay selectedTime = TimeOfDay(hour: dateTime.hour , minute: dateTime.minute);
     return selectedTime;
   }
   catch(exc){
     return TimeOfDay.now();
   }

}



String convertDateToString (String dateFormatStr){

    try{
      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm");
      String stringDate = dateFormat.format(DateTime.parse(dateFormatStr));
      stringDate = stringDate.replaceAll("-", "/");
      return stringDate;
    }
    catch (exc) {
      print("problem issssssssss : $exc");
      return "N/A";
    }

}


String convertJustDateToString (String dateFormatStr){

  try{
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String stringDate = dateFormat.format(DateTime.parse(dateFormatStr));
    stringDate = stringDate.replaceAll("-", "/");
    return stringDate;
  }
  catch (exc) {
    print("problem issssssssss : $exc");
    return "N/A";
  }

}


String convertJustTimeToString (String dateFormatStr){

  try{
    DateFormat dateFormat = DateFormat("HH:mm");
    String stringDate = dateFormat.format(DateTime.parse(dateFormatStr));
    stringDate = stringDate.replaceAll("-", "/");
    return stringDate;
  }
  catch (exc) {
    print("problem issssssssss : $exc");
    return "N/A";
  }

}


String convertTimeOfDayToString(TimeOfDay tod) {

  try{

    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    //final format = DateFormat.jm();  //"6:00 AM"
    String  fmt = DateFormat("HH:mm").format(dt);
    return fmt;

  }
  catch (exc){
    return("N/A");
  }

}

String extractJustDate(String dateAndTime){
  try{
    var parts = dateAndTime.split(' ');
    var prefix = parts[0].trim();
    return prefix;
  }
  catch (exc) {
    print("problem issssssssss : $exc");
    return "N/A";
  }
}

// -------------------------- check if string is numeric only int -----------------------

bool isStringNumeric(String strValue){

  final validCharacters = RegExp(r'^[0-9]+$');

  if(validCharacters.hasMatch(strValue)){
    return true;
  }
  else {
    return false;
  }

  //// alphanumeric
//static final  validCharacters = RegExp(r'^[a-zA-Z0-9]+$');

//// alphanumeric and &%=
//static final validCharacters = RegExp(r'^[a-zA-Z0-9&%=]+$');



}
//----------------------------- check if string is numeric int and double -------------------------

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

// -------------------------- check if string is blank -----------------------

bool isStringBlank(String strValue){

  final validCharacters = RegExp(r'^[ ]+$');

  if(validCharacters.hasMatch(strValue)){
    return true;
  }
  else {
    return false;
  }


}

//----------------------------- convert string to mD5 --------------------------

// String generateMd5(String data) {
//   var content = new Utf8Encoder().convert(data);
//   var md5 = crypto.md5;
//   var digest = md5.convert(content);
//   return hex.encode(digest.bytes);
// }

//----------------------------- number converter -------------------------------
String replaceFarsiNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], farsi[i]);
  }
  return input;
}

String replaceEnglishNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < farsi.length; i++) {
    input = input.replaceAll(farsi[i], english[i]);
  }
  return input;
}
//------------------------- convert to money format ----------------------------
String convertToMoneyFormat(var numValue){

  final formatter = new NumberFormat("#,###", "en_US");

  if(isNumeric(numValue)){

    if(numValue is! int){
      numValue = int.parse(numValue);
    }

    return formatter.format(numValue);
  }
  else{
    return 'N/A'; //must be numeric
  }
}
//------------------------------------------------------------------------------


Map<String,String> basicAuthHeaderMaker(String userName,String passWord){

  final basicAuth = 'Basic ' + base64Encode(utf8.encode('$userName:$passWord'));
  final Map<String, String> authHeader = {
    'Content-type': 'application/json',
    "Accept": "application/json;charset=UTF-8",
    "Authorization": "$basicAuth",
  };
  return authHeader;

}

//----------------------------- navigator animation ---------------------------

// fade in
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}

// scale
class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({required this.page}) : super(opaque : false,
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
  );
}

// size
class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        Align(
          child: SizeTransition(
            sizeFactor: animation,
            child: child,
          ),
        ),
  );
}

//slide right
class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}


//slide up
class SlideUpRoute extends PageRouteBuilder {
  final Widget page;
  SlideUpRoute({required this.page})
      : super(opaque:false,
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}


//rotaion
class RotationRoute extends PageRouteBuilder {
  final Widget page;
  RotationRoute({required this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        RotationTransition(
          turns: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.linear,
            ),
          ),
          child: child,
        ),
  );
}






