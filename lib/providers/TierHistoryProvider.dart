import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';
import 'package:loyalty_app/models/TierHistoryModel.dart';

class TierHistoryProvider with ChangeNotifier {


  TierHistoryModel _tierHistoryModel;

  TierHistoryProvider();
  TierHistoryProvider.init(String memberId){
    fetchTierHistory(memberId);
  }

  TierHistoryModel get getTierHistoryModel => _tierHistoryModel;

  set setTierHistoryModel(TierHistoryModel value) {
    _tierHistoryModel = value;
    notifyListeners();
  }


  void fetchTierHistory(String memberId)async{

    var tierHistoryModel = await MemberRepository().callFetchTierHistory(memberId);
    this._tierHistoryModel = tierHistoryModel;
    // print('this is coupons model product name ==================>>>>>>> ${_couponsModel.result[0].productName}');
    notifyListeners();

  }







}