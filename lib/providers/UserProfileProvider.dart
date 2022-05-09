import 'package:flutter/cupertino.dart';
import 'package:emdad_khodro_saipa/models/UserProfileModel.dart';
import 'package:emdad_khodro_saipa/repository/MemberRepository.dart';

class UserProfileProvider extends ChangeNotifier {

  UserProfileModel? _profileInfoModel;


  UserProfileModel get getProfileInfoModel => _profileInfoModel!;

  set setProfileInfoModel(UserProfileModel value) {
    _profileInfoModel = value;
  }


  void fetchProfileInfo(String memberId)async{
    var profileInfoModel;
     // profileInfoModel = await MemberRepository().callFetchUserProfileInfo(memberId);
    this._profileInfoModel = profileInfoModel;
    notifyListeners();
  }


}