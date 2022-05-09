import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/EclusivePackageActivationResponseModel.dart';
import 'package:loyalty_app/models/ExclusivePackageModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';

class ExclusivePackageProvider with ChangeNotifier {


  ExclusivePackageModel _exclusivePackageModel;
  ExclusivePackageActivationResponseModel _exclusivePackageActivationResponseModel;

  ExclusivePackageProvider();
  ExclusivePackageProvider.init(String memberId){
    fetchExclusivePackageOffer(memberId);
  }

  ExclusivePackageModel get getExclusivePackageModel => _exclusivePackageModel;

  set setExclusivePackageModel(ExclusivePackageModel value) {
    _exclusivePackageModel = value;
    notifyListeners();
  }


  void fetchExclusivePackageOffer(String memberId)async{

    var exclusivePackageModel = await MemberRepository().callExclusivePackageOffer(memberId);
    this._exclusivePackageModel = exclusivePackageModel;
    notifyListeners();

  }

  // Future<ExclusivePackageActivationResponseModel> activateExclusivePackage(String price) async {
  //   ExclusivePackageActivationResponseModel exclusivePackageActivationResponseModel = await MemberRepository().callActivateExclusivePackage(price);
  //   return exclusivePackageActivationResponseModel;
  // }
}