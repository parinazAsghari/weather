import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';
import 'package:loyalty_app/models/CouponsModel.dart';

class CouponsProvider with ChangeNotifier {


  CouponsModel _couponsModel;

  CouponsProvider();
  CouponsProvider.init(String memberId){
    fetchCoupons(memberId);
  }

  CouponsModel get getCouponsModel => _couponsModel;

  set setCouponsModel(CouponsModel value) {
    _couponsModel = value;
    notifyListeners();
  }


  void fetchCoupons(String memberId)async{

    var couponsListModel = await MemberRepository().callFetchCouponsList(memberId);
    this._couponsModel = couponsListModel;
    // print('this is coupons model product name ==================>>>>>>> ${_couponsModel.result[0].productName}');
    notifyListeners();

  }







}