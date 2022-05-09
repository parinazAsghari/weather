

/*


import 'dart:convert';
import 'package:loyalty_app/models/ActiveTierModel.dart';
import 'package:loyalty_app/models/CouponsModel.dart';
import 'package:loyalty_app/models/EclusivePackageActivationResponseModel.dart';
import 'package:loyalty_app/models/ExclusivePackageModel.dart';
import 'package:loyalty_app/models/IntroducedPeopleModel.dart';
import 'package:loyalty_app/models/LoanPaymentsModel.dart';
import 'package:loyalty_app/models/LoansModel.dart';
import 'package:loyalty_app/models/MainResponseModel.dart';
import 'package:loyalty_app/models/MemberInfoModel.dart';
import 'package:loyalty_app/models/PointTypesModel.dart';
import 'package:loyalty_app/models/ProductsModel.dart';
import 'package:loyalty_app/models/LoyaltyProfileModel.dart';
import 'package:loyalty_app/models/PromotionsModel.dart';
import 'package:loyalty_app/models/ScoreInfoModel.dart';
import 'package:loyalty_app/models/TierHistoryModel.dart';
import 'package:loyalty_app/models/TransactionInfoModel.dart';
import 'package:loyalty_app/models/UserProfileModel.dart';
import 'package:loyalty_app/utils/CommonUtils.dart';
import 'package:loyalty_app/utils/Consts.dart';
import 'package:loyalty_app/utils/NetworkModule.dart';


class MemberRepository {


  static final MemberRepository _memberRepository = MemberRepository._();
  MemberRepository._();
  factory MemberRepository()=>_memberRepository;


  Future<bool> callAuthenticate (String userName,String passWord)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'User Name' : '$userName',
      'Password' : '$passWord',
      'GetPrivateCredentials' : 'Y'
    };
    var body = json.encode(bodyMap);
    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'Authentication Business Service/Authenticate',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null&&mainResponseModel.data.toString().contains(userName)){
      return true;
    }
    else{
      return false;
    }
  }


  Future<bool> callChangePassword (String userName,String oldPassWord,String newPassWord)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'New Password' : '$newPassWord',
      'Password' : '$oldPassWord',
      'User Name' : '$userName'
    };
    var body = json.encode(bodyMap);
    var header = basicAuthHeaderMaker(userName, oldPassWord);
    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'Authentication Business Service/ChangePassword',body: body,header: header,);
    if(mainResponseModel.data!=null){
      return true;
    }
    else{
      return false;
    }
  }


  Future<MemberInfoModel> callFetchMemberInfo(String userName)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'Username' : '$userName',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyMemberWebService/GetMemberId1',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      MemberInfoModel memberInfoModel = MemberInfoModel.fromJson(json.decode(mainResponseModel.data));
      return memberInfoModel;
    }
    else{
      return null;
    }

  }


  Future<LoyaltyProfileModel> callFetchLoyaltyProfileInfo(String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyMemberWebService/MemProfileInfo',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      LoyaltyProfileModel profileInfoModel = LoyaltyProfileModel.fromJson(json.decode(mainResponseModel.data));
      return profileInfoModel;
    }
    else{
      return null;
    }
  }


  Future<UserProfileModel> callFetchUserProfileInfo(String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyMemberWebService/MemMembershipInfo',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      UserProfileModel profileInfoModel = UserProfileModel.fromJson(json.decode(mainResponseModel.data));

      return profileInfoModel;
    }
    else{
      return null;
    }
  }

  Future<ScoreInfoModel> callFetchScoreInfo(String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyTransactionWebService/GetPointsSum',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      ScoreInfoModel scoreInfoModel = ScoreInfoModel.fromJson(json.decode(mainResponseModel.data));
      return scoreInfoModel;
    }
    else{
      return null;
    }
  }

/*
  Future<ScoreInfoModel> callFetchScoreInfo(String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyMemberWebService/GetPoints',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      ScoreInfoModel scoreInfoModel = ScoreInfoModel.fromJson(json.decode(mainResponseModel.data));
      return scoreInfoModel;
    }
    else{
      return null;
    }
  }
*/

  Future<PointTypesModel> callFetchPointTypes(String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyMemberWebService/GetPoints1',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      PointTypesModel pointTypesModel = PointTypesModel.fromJson(json.decode(mainResponseModel.data));
      return pointTypesModel;
    }
    else{
      return null;
    }
  }


  Future<String> callFetchRemainScoreZZZ(String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyMemberWebService/GetPoints',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      ScoreInfoModel scoreInfoModel = ScoreInfoModel.fromJson(json.decode(mainResponseModel.data));
      return scoreInfoModel.point1Value;
    }
    else{
      return null;
    }
  }




  Future<TransactionInfoModel> callFetchTransactionList(String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyTransactionWebService/GetAllTransactions',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      TransactionInfoModel transactionInfoModel = TransactionInfoModel.fromJson(json.decode(mainResponseModel.data));
      return transactionInfoModel;
    }
    else{
      return null;
    }
  }



  Future<IntroducedPeopleModel> callFetchIntroducedPeopleList (String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyReferenceWebService/GetReferentialNames',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      IntroducedPeopleModel introducedPeopleModel = IntroducedPeopleModel.fromJson(json.decode(mainResponseModel.data));
      return introducedPeopleModel;
    }
    else{
      return null;
    }
  }



  Future<PromotionsModel> callFetchPromotionsList (String programId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'ProgramId' : '$programId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyPromotionWebService/GetAllPromotions',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      PromotionsModel promotionsModel = PromotionsModel.fromJson(json.decode(mainResponseModel.data));
      return promotionsModel;
    }
    else{
      return null;
    }
  }



  Future<ProductsModel> callFetchProductsList (String programId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'ProgramId' : '$programId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyProgramWebService/GetLoyaltyProductsWithImages',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      ProductsModel productsModel = ProductsModel.fromJson(json.decode(mainResponseModel.data));
      return productsModel;
    }
    else{
      return null;
    }
  }


  Future<LoansModel> callFetchLoans(String memberId,[String language])async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
      //'Language' : '$language',
    };
    var body = json.encode(bodyMap);
    MainResponseModel mainResponseModel = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyTransactionWebService/MemberLoanList',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      LoansModel loansModel = LoansModel.fromJson(json.decode(mainResponseModel.data));
      return loansModel;
    }
    else{
      return null;
    }
  }


  Future<LoanPaymentsModel> callFetchLoanPayments(String memberId,String loanTransactionId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
      'LoanTransactionId' : '$loanTransactionId',
    };
    var body = json.encode(bodyMap);
    MainResponseModel mainResponseModel = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyTransactionWebService/MemberLoanRepayments',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      LoanPaymentsModel loanPaymentsModel = LoanPaymentsModel.fromJson(json.decode(mainResponseModel.data));
      return loanPaymentsModel;
    }
    else{
      return null;
    }
  }


  Future<bool> callSubmitLoanRepayment(String memberId,String programId,String programName,String repaidPoints,String loanTransactionId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
      'ProgramId' : '$programId',
      'ProgramName' : '$programName',
      'RepaidPoints' : '$repaidPoints',
      'LoanTransactionId' : '$loanTransactionId'
    };
    var body = json.encode(bodyMap);
    var header = basicAuthHeaderMaker('sadmin', 'oracle');
    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyTransactionWebService/LoanRepayment',body: body,header: header,);
    //String resultCode = json.decode(mainResponseModel.data)['ResponseCode'].toString();
    if(mainResponseModel.data!=null&&json.decode(mainResponseModel.data)['ResponseCode'].toString()=='0'){
      return true;
    }
    else{
      return false;
    }

  }


  Future<bool> callSubmitLoanRequest(String memberId,String pointType,String points,String programName)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
      'PointType' : '$pointType',
      'Points' : '$points',
      'ProgramName' : '$programName'
    };
    var body = json.encode(bodyMap);
    var header = basicAuthHeaderMaker('sadmin', 'oracle');
    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyTransactionWebService/LoanRequest',body: body,header: header,);
    //String resultCode = json.decode(mainResponseModel.data)['ResponseCode'].toString();
    if(mainResponseModel.data!=null&&json.decode(mainResponseModel.data)['ResponseCode'].toString()=='0'){
      return true;
    }
    else{
      return false;
    }

  }


  Future<bool> callPayWithScore ({String user,String pass,String memberId,String productId,String productName,String programId,String programName})async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
      'ProductId' : '$productId',
      'ProductName' : '$productName',
      'ProgramId' : '$programId',
      'ProgramName' : '$programName',
    };
    var body = json.encode(bodyMap);
    var header = basicAuthHeaderMaker('sadmin', 'oracle');
    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyProgramWebService/RedeemVoucherMCI1',body: body,header: header,);
    //String resultCode = json.decode(mainResponseModel.data)['ResponseCode'].toString();
    //print('-----------ccccccccccc--------- $resultCode');
    if(mainResponseModel.data!=null&&json.decode(mainResponseModel.data)['ResponseCode'].toString()=='0'){
      return true;
    }
    else{
      return false;
    }
  }



  //-------------------- salman methods goes down here -------------------------

  Future<CouponsModel> callFetchCouponsList (String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyMemberWebService/GetMemVouchers',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      CouponsModel couponsModel = CouponsModel.fromJson(json.decode(mainResponseModel.data));
      print('this is result product nameeeee ====>>>>>>>>>>> ${couponsModel.result[0].productName}');

      return couponsModel;
    }
    else{
      return null;
    }
  }

  Future<bool> callIntroduceMember(String memberId,String comment,String email,String name,String family)async {
    Map<String, Map<String, dynamic>> bodyMap = Map<String,
        Map<String, dynamic>>();
    bodyMap['body'] = {
      'MemberId': '$memberId',
      'Comment': '$comment',
      'EmailAddress': '$email',
      'FirstName': '$name',
      'MiddleName': '',
      'LastName': '$family',
      'M/M': ''
    };
    var body = json.encode(bodyMap);
    var header = basicAuthHeaderMaker('sadmin', 'oracle');
    MainResponseModel mainResponseModel = await NetworkModule.networkModule
        .postRequest(url: BaseUrl + 'LoyaltyReferenceWebService/AddReferential',
      body: body,
      header: header,);
    //String resultCode = json.decode(mainResponseModel.data)['ResponseCode'].toString();
    if (mainResponseModel.data != null &&
        json.decode(mainResponseModel.data)['ResponseCode'].toString() == '0') {
      return true;
    }
    else {
      return false;
    }
  }

  Future<ActiveTierModel> callFetchActiveTier(String memberId)async{
  Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
  bodyMap['body'] = {
    'MemberId' : '$memberId',
  };
  var body = json.encode(bodyMap);
  MainResponseModel mainResponseModel = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyTierWebService/GetActiveTier',body: body,header: CommonHeader,);
  if(mainResponseModel.data!=null){
    ActiveTierModel activeTierModel = ActiveTierModel.fromJson(json.decode(mainResponseModel.data));
    print('this is tier class =====>>>> ${activeTierModel.tierClass}');
    return activeTierModel;
  }
  else{
    return null;
  }
}


  Future<TierHistoryModel> callFetchTierHistory (String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyTierWebService/GetTierHistory',body: body,header: CommonHeader,);
    if(mainResponseModel.data!=null){
      TierHistoryModel tierHistoryModel = TierHistoryModel.fromJson(json.decode(mainResponseModel.data));
      print('this is result tire history class name [0]====>>>>>>>>>>> ${tierHistoryModel.result[0].tierClass}');

      return tierHistoryModel;
    }
    else{
      return null;
    }
  }



  Future<ExclusivePackageModel> callExclusivePackageOffer (String memberId)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MemberId' : '$memberId',
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyMemberWebService/GetOfferedPackage',body: body,header: AuthHeader,);
    if(mainResponseModel.data!=null){
      ExclusivePackageModel exclusivePackageModel = ExclusivePackageModel.fromJson(json.decode(mainResponseModel.data));
      print('this is result ExclusivePackageModel ====>>>>>>>>>>> ${exclusivePackageModel.offeredPackage}  + ${exclusivePackageModel.packageVolume} ');

      return exclusivePackageModel;
    }
    else{
      return null;
    }
  }



  Future<ExclusivePackageActivationResponseModel> callActivateExclusivePackage(String price,String membershipNumber)async{
    Map<String,Map<String,dynamic>> bodyMap =  Map<String,Map<String,dynamic>>();
    bodyMap['body'] = {
      'MembershipNumber' : '$membershipNumber',
      "ProductName":"خرید و فعالسازی بسته اینترنت همراهی",
      "ProgramName":"کمپین همراهی",
      "TransactionType":"Accrual",
      "TransactionSubType":"Action Based Bonus",
      "َAmount":"$price"
    };
    var body = json.encode(bodyMap);

    MainResponseModel mainResponseModel  = await NetworkModule.networkModule.postRequest(url: BaseUrl+'LoyaltyProgramWebService/RegisterProcessTnx',body: body,header: AuthHeader,);
    if(mainResponseModel.data!=null){
      ExclusivePackageActivationResponseModel exclusivePackageActivationResponseModel = ExclusivePackageActivationResponseModel.fromJson(json.decode(mainResponseModel.data));
      print('this is result ExclusivePackageActivationResponseModel ====>>>>>>>>>>> ${exclusivePackageActivationResponseModel.transactionSubStatus}');

      return exclusivePackageActivationResponseModel;
    }
    else{
      return null;
    }
  }






}


 */