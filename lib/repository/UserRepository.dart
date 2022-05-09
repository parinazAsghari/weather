

/*

import 'dart:convert';
import 'package:loyalty_app/models/UserIPModel.dart';
import 'package:loyalty_app/utils/Consts.dart';
import 'package:loyalty_app/utils/NetworkModule.dart';

class UserRepository {

  static final UserRepository _userRepository = UserRepository._();
  UserRepository._();
  factory UserRepository()=>_userRepository;

  Future<UserIPModel> fetchUserIp ()async{

    try{
      Map<String, String> header = {
        'Content-type': 'application/json',
        "Accept": "application/json;charset=UTF-8",
      };
      String result = await NetworkModule.networkModule.getRequest('https://api.myip.com', header);
      var resultModel =  UserIPModel.fromJson(json.decode(result));
      print('$LogTag --- Repository Print --->  $result');
      return resultModel;
    }
    catch (exc) {
      return null;
    }

  }


}


 */