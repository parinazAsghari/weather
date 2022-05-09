import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/UserProfileModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';

class UserProfileProvider extends ChangeNotifier {

  UserProfileModel _profileInfoModel;


  UserProfileModel get getProfileInfoModel => _profileInfoModel;

  set setProfileInfoModel(UserProfileModel value) {
    _profileInfoModel = value;
  }


  void fetchProfileInfo(String memberId)async{
    var profileInfoModel = await MemberRepository().callFetchUserProfileInfo(memberId);
    this._profileInfoModel = profileInfoModel;
    notifyListeners();
  }


}