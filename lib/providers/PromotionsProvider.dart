import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/PromotionsModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';

class PromotionsProvider with ChangeNotifier {


  PromotionsModel _promotionsModel;

  PromotionsProvider();
  PromotionsProvider.init(String programId){
    fetchPromotions(programId);
  }

  PromotionsModel get getPromotionModel => _promotionsModel;

  set setPromotionModel(PromotionsModel value) {
    _promotionsModel = value;
  }


  void fetchPromotions(String programId)async{

    var promotionsListModel = await MemberRepository().callFetchPromotionsList(programId);
    this._promotionsModel = promotionsListModel;
    notifyListeners();

  }







}