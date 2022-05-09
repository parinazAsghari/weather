import 'package:flutter/foundation.dart';
import 'package:emdad_khodro_saipa/models/MemberInfoModel.dart';
import 'package:emdad_khodro_saipa/repository/MemberRepository.dart';
import 'package:emdad_khodro_saipa/utils/SharedPrefsUtil.dart';


class HomeProvider extends ChangeNotifier {

  MemberInfoModel? _memberInfoModel;
  String _programName = "---" ;


  MemberInfoModel get getMemberInfoModel => _memberInfoModel!;

  set setMemberInfoModel(MemberInfoModel value) {
    _memberInfoModel = value;
    notifyListeners();
  }


  String get getProgramName => _programName;

  set setProgramName(String value) {
    _programName = value;
    notifyListeners();
  }

  Future<MemberInfoModel?> fetchMemberInfo(String userName)async{
    var memberInfoModel ;
    // var memberInfoModel = await MemberRepository().callFetchMemberInfo(userName);
     SharedPrefsUtil.prefsInstance.saveStringToPrefs('MemberId', memberInfoModel.result[0].memberId);
    this._memberInfoModel = memberInfoModel;
    notifyListeners();
    return _memberInfoModel;
  }




}