import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/ActiveTierModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';
class ActiveTierProvider with ChangeNotifier {


  ActiveTierModel _activeTierModel;

  ActiveTierProvider();
  ActiveTierProvider.init(String memberId){
    fetchTier(memberId);
  }

  ActiveTierModel get getActiveTierModel => _activeTierModel;

  set setActiveTierModel(ActiveTierModel value) {
    _activeTierModel = value;
    notifyListeners();
  }


  void fetchTier(String memberId)async{

    var activeTierModel = await MemberRepository().callFetchActiveTier(memberId);
    this._activeTierModel = activeTierModel;
    // print('this is coupons model product name ==================>>>>>>> ${_couponsModel.result[0].productName}');
    notifyListeners();

  }







}