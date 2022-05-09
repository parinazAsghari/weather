import 'package:flutter/foundation.dart';
import 'package:loyalty_app/models/ScoreInfoModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';

class ScoreProvider with ChangeNotifier{

  ScoreInfoModel _scoreInfoModel;

  ScoreProvider();

  ScoreProvider.init(String memberId){
    fetchScores(memberId);
  }

  ScoreInfoModel get getScoreInfoModel => _scoreInfoModel;

  set setScoreInfoModel(ScoreInfoModel value) {
    _scoreInfoModel = value;
  }


  void fetchScores(String memberId)async{
    var scoreInfoModel = await MemberRepository().callFetchScoreInfo(memberId);
    this._scoreInfoModel = scoreInfoModel;
    notifyListeners();
  }



}