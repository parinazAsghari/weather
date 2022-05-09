import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/TransactionInfoModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';

class TransactionProvider with ChangeNotifier{

  TransactionInfoModel _transactionInfoModel;

  TransactionProvider();
  TransactionProvider.init(String memberId){
    fetchTransactions(memberId);
  }

  TransactionInfoModel get getTransactionInfoModel => _transactionInfoModel;

  set setTransactionInfoModel(TransactionInfoModel value) {
    _transactionInfoModel = value;
  }


  void fetchTransactions(String memberId)async{

    var transactionsInfoModel = await MemberRepository().callFetchTransactionList(memberId);
    this._transactionInfoModel = transactionsInfoModel;
    notifyListeners();

  }



}