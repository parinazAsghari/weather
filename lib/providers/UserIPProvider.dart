import 'package:flutter/foundation.dart';
import 'package:loyalty_app/models/UserIPModel.dart';
import 'package:loyalty_app/repository/UserRepository.dart';
import 'package:loyalty_app/utils/Consts.dart';

class UserIPProvider with ChangeNotifier {

  UserIPModel _userIPModel;

  UserIPModel get getUserIPModel => _userIPModel;

//  UserProvider(){
//    fetchUserIp();
//  }

  void onRefresh(){
    _userIPModel = null;
    notifyListeners();
    fetchUserIp();
  }

  void fetchUserIp ()async{
    //here we fetch data from web
    var userIpModel = await UserRepository().fetchUserIp();
    _userIPModel = userIpModel;
    notifyListeners();
  }


  void setUserIPModel(UserIPModel value) {
    _userIPModel = value;
  }


}