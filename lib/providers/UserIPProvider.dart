import 'package:flutter/foundation.dart';
import 'package:emdad_khodro_saipa/models/UserIPModel.dart';
import 'package:emdad_khodro_saipa/repository/UserRepository.dart';
import 'package:emdad_khodro_saipa/utils/Consts.dart';

class UserIPProvider with ChangeNotifier {

  UserIPModel? _userIPModel;

  UserIPModel get getUserIPModel => _userIPModel!;

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
    var userIpModel ;
    // var userIpModel = await UserRepository().fetchUserIp();
    _userIPModel = userIpModel;
    notifyListeners();
  }


  void setUserIPModel(UserIPModel value) {
    _userIPModel = value;
  }


}