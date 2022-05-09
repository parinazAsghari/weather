import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/IntroducedPeopleModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';

class IntroduceProvider extends ChangeNotifier {

  IntroducedPeopleModel _introducedPeopleList = IntroducedPeopleModel();

  IntroduceProvider();


  IntroducedPeopleModel get introducedPeopleList => _introducedPeopleList;

  set introducedPeopleList(IntroducedPeopleModel value) {
    _introducedPeopleList = value;
  }

  Future<IntroducedPeopleModel> fetchIntroducedPeopleList(String programId)async{

    var introducedListModel = await MemberRepository().callFetchIntroducedPeopleList(programId);
    this._introducedPeopleList = introducedListModel;
    return this._introducedPeopleList;
    //notifyListeners();

  }




}