import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/LoansModel.dart' as LoansModel;
import 'package:loyalty_app/models/PointTypesModel.dart' as PointTypesModel;
import 'package:loyalty_app/repository/MemberRepository.dart';

class LoansProvider with ChangeNotifier {

  LoansModel.LoansModel _loansModel;
  PointTypesModel.PointTypesModel _pointTypesModel;
  int _pointTypeGroupValue = -1;
  String _selectedPointType;
  String _pointAmount;


  int get getPointTypeGroupValue => _pointTypeGroupValue;

  set setPointTypeGroupValue(int value) {
    _pointTypeGroupValue = value;
    notifyListeners();
  }


  String get getSelectedPointType => _selectedPointType;

  set setSelectedPointType(String value) {
    _selectedPointType = value;
  }

  Future<LoansModel.LoansModel> fetchLoans (String memberId,[String language])async{
    _loansModel = await MemberRepository().callFetchLoans(memberId);
    return _loansModel;
  }


  Future<PointTypesModel.PointTypesModel> fetchPointTypes(String memberId)async{
    _pointTypesModel = await MemberRepository().callFetchPointTypes(memberId);
    return _pointTypesModel;
  }

  String get getPointAmount => _pointAmount;

  set setPointAmount(String value) {
    _pointAmount = value;
  }



  Future<bool> submitLoanRequest (String memberId,String programName)async{
    bool result = await MemberRepository().callSubmitLoanRequest(memberId, _selectedPointType, _pointAmount, programName);
    return result;
  }


}