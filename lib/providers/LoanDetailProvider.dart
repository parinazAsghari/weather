import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/LoanPaymentsModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';

class LoanDetailProvider with ChangeNotifier {

  LoanPaymentsModel _loanPaymentsModel;


  Future<LoanPaymentsModel> fetchLoanPayments (String memberId,String loanTransactionId)async{
    _loanPaymentsModel = await MemberRepository().callFetchLoanPayments(memberId, loanTransactionId);
    return _loanPaymentsModel;
  }



}