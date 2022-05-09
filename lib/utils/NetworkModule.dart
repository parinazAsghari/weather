import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:loyalty_app/models/MainResponseModel.dart';
import 'dart:convert';
import 'Consts.dart';

class NetworkModule {

  NetworkModule._();
  static final NetworkModule networkModule =  NetworkModule._();
  final int timeOut= 35;



  //------------------------- https methods

  /*
  Future<MainResponseModel> postRequest ({@required var url,@required var body,@required var header,var enCode,int timeOutSecond}) async {

    try {
      print('$timeOut');

      HttpClient client = new HttpClient();
      client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
      client.connectionTimeout = Duration(seconds: timeOutSecond ?? timeOut);
      client.idleTimeout = Duration(seconds: timeOutSecond ?? timeOut);
      HttpClientRequest request = await client.postUrl(Uri.parse(BaseUrl+url));

      header?.forEach((k, v){
        request.headers.set(k, v);
      });

      debugPrint(body);

      if(body!=null){
        request.add(utf8.encode(body));
      }


      HttpClientResponse response = await request.close().timeout(Duration(seconds: timeOutSecond ?? timeOut));
      int statusCode = response.statusCode;
      String result = await response.transform(utf8.decoder).join();
      loggingInterceptor(response,result);
      client.close();
      if(statusCode != 200){
        return responseErrorHandling(statusCode,'Internal Error');
      }
      else {
        return responseErrorHandling(statusCode,result);
      }
    } catch (ex){

      print("$LogTag Rest failed exception is : $ex");
      return responseErrorHandling(13,'Internal Error');

    }

  }

   */


  Future<String> getRequest (var url,Map<String,String> header) async {

    try{

      http.Response response = await http.get(url,headers: header).timeout(Duration(seconds: timeOut));

      int statusCode = response.statusCode;

      if(statusCode != 200){
        //throw new Exception("error while fetching data $statusCode");
        return "fail";
      }
      else {
        print('$LogTag --- Network Module Print --->  ${response.body}');
        String body = response.body;
        return body;
      }

    }
    on Exception catch(ex){
      print("Dcare Loger=> error is : $ex");
      return "fail";
    }

  }




//--------------------


  /*
  MainResponseModel responseErrorHandling(int code,String result){
    MainResponseModel mainResponseModel = MainResponseModel();
    if(code==200){
      mainResponseModel.code = code;
      mainResponseModel.description = 'tempDesc';
      mainResponseModel.data = result;
    }
    else{
      mainResponseModel.code = code;
      mainResponseModel.description = 'Request Failed';
      mainResponseModel.data = null;
    }


//    if(code==0){
//
//    }
//    else if(code==1){
//
//    }
//    else if(code==2){
//
//    }
//    else{
//      mainResponseModel.code = code;
//      mainResponseModel.description = 'internal error';
//    }

    print('-----------------------x-x-x-x-x 22222222 ---------- ${mainResponseModel.code} -------- ${mainResponseModel.description} ------- ${mainResponseModel.data}');
    return mainResponseModel;
  }

   */


  void loggingInterceptor(HttpClientResponse response,String result){

    print("$LogTag Rest Request status code is : ${response.statusCode} \n");
    print("$LogTag Rest Request header is : ${response.headers} \n");
    print("$LogTag Rest Request response body is : $result \n");
    log("$LogTag Rest Request response body is : $result \n");

  }

}