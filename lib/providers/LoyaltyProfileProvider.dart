import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/LoyaltyProfileModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';

class LoyaltyProfileProvider extends ChangeNotifier {

  LoyaltyProfileModel _profileInfoModel;


  LoyaltyProfileModel get getProfileInfoModel => _profileInfoModel;

  set setProfileInfoModel(LoyaltyProfileModel value) {
    _profileInfoModel = value;
  }


  void fetchProfileInfo(String memberId)async{
    var profileInfoModel = await MemberRepository().callFetchLoyaltyProfileInfo(memberId);
    this._profileInfoModel = profileInfoModel;
    notifyListeners();
  }


}