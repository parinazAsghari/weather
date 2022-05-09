import 'package:flutter/cupertino.dart';
import 'package:loyalty_app/models/ProductsModel.dart';
import 'package:loyalty_app/models/PromotionsModel.dart';
import 'package:loyalty_app/repository/MemberRepository.dart';

class ProductsProvider with ChangeNotifier {


  ProductsModel _productsModel;

  ProductsProvider();
  ProductsProvider.init(String programId){
    fetchProducts(programId);
  }

  ProductsModel get getProductsModel => _productsModel;

  set setProductsModel(ProductsModel value) {
    _productsModel = value;
    notifyListeners();
  }


  void fetchProducts(String programId)async{

    var productsListModel = await MemberRepository().callFetchProductsList(programId);
    this._productsModel = productsListModel;
    notifyListeners();

  }







}