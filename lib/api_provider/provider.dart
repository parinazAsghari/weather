import 'dart:convert';

import 'package:emdad_khodro_saipa/constants.dart';
import 'package:emdad_khodro_saipa/models/GeoLocation.dart';
import 'package:emdad_khodro_saipa/models/address_request.dart';
import 'package:emdad_khodro_saipa/models/request_model/SendEmdadRequest.dart';
import 'package:emdad_khodro_saipa/models/request_model/SendGetEmdadgarList.dart';
import 'package:emdad_khodro_saipa/models/request_model/SendGetPackagesRequest.dart';
import 'package:emdad_khodro_saipa/models/request_model/SendGetReservableDatesRequest.dart';
import 'package:emdad_khodro_saipa/models/request_model/SendUrgentRequest.dart';
import 'package:emdad_khodro_saipa/models/response_model/EmdadRequestResponse.dart';
import 'package:emdad_khodro_saipa/models/response_model/GetEmdadgarListResponse.dart';
import 'package:emdad_khodro_saipa/models/response_model/GetPackagesResponse.dart';
import 'package:emdad_khodro_saipa/models/response_model/GetReservableDatesResponse.dart';
import 'package:emdad_khodro_saipa/models/response_model/UrgentRequestResponse.dart';
import 'package:emdad_khodro_saipa/models/response_model/login.dart';
import 'package:emdad_khodro_saipa/models/response_model/search_address_response.dart';
import 'package:emdad_khodro_saipa/models/response_model/send_login_otp.dart';
import 'package:emdad_khodro_saipa/models/weather_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/car_info.dart';
import '../models/response_model/main_server_general_response.dart';
import '../models/response_model/profile.dart';
import '../models/user_info.dart';

class ApiProvider {

  static Future<AddressRequest> getAddress(LatLng latLng) async {
    Map<String,String> headers = {
      'x-api-key': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIn0.eyJhdWQiOiIxODA2MSIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIiwiaWF0IjoxNjUzMzg3MDkxLCJuYmYiOjE2NTMzODcwOTEsImV4cCI6MTY1NTk3OTA5MSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.jDw7w-nTooFaIOmB5ufzDhGu5ESYzD_jUDkvfHh6HunR8Jk3dORUXoHwFw54vCZW4OS9Vrnyv5M1Qd-VJZ9KgMboM_vx5R3bzOCnsCr9IKZ7k3J_EXZzQgYdf1m9G0TNijr5Y9mIWKZPVyt-FODyeg0BzjS-YaxYKLioy0LzUUzDG4OgA9bn-MvlbmZA2zTwwqCpjF89DwUuCkghtehrPtW_VSn_sJ4y6dhcngDiW6hJmD8HGFmOGH1WDp31aZxukkp3QYEl0fihhh23vgU7ll7Oiz4pTztLoErOd_6QL7xxmGjaTcsh8L8os3lz-h34GqOlREozkyTVp6V4pgcMlA',

    };


    var result = await http.get(
        // Uri.http('map.ir', '/reverse?lat=${latLng.latitude}&lon=${latLng.longitude}'),
        Uri.https('map.ir', '/reverse', {'lat': '${latLng.latitude}', 'lon': '${latLng.longitude}'}),
        headers: headers);

    return AddressRequest.fromJson(json.decode(result.body));
  }


  static Future<SearchAddressResponse> searchAddress(String text, LatLng latLng) async {
    Map<String,String> headers = {
      'x-api-key': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIn0.eyJhdWQiOiIxODA2MSIsImp0aSI6IjQxZmNiZjFjMzZkMWQ2ODY2Y2VmZDg5ZDcyYjkzOWNlOWU3N2FlZGFmOTZkYzVhMGU3Mjk4YTdmMTUwOTY3ZjNlOTQxYmMxYTE1ZWFiNmQwIiwiaWF0IjoxNjUzMzg3MDkxLCJuYmYiOjE2NTMzODcwOTEsImV4cCI6MTY1NTk3OTA5MSwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.jDw7w-nTooFaIOmB5ufzDhGu5ESYzD_jUDkvfHh6HunR8Jk3dORUXoHwFw54vCZW4OS9Vrnyv5M1Qd-VJZ9KgMboM_vx5R3bzOCnsCr9IKZ7k3J_EXZzQgYdf1m9G0TNijr5Y9mIWKZPVyt-FODyeg0BzjS-YaxYKLioy0LzUUzDG4OgA9bn-MvlbmZA2zTwwqCpjF89DwUuCkghtehrPtW_VSn_sJ4y6dhcngDiW6hJmD8HGFmOGH1WDp31aZxukkp3QYEl0fihhh23vgU7ll7Oiz4pTztLoErOd_6QL7xxmGjaTcsh8L8os3lz-h34GqOlREozkyTVp6V4pgcMlA',
      'Content-Type': 'application/json'

    };

    Map data = {
      // "\$filter": "distance",
      "\$select": "nearby",
      "lat": latLng.latitude,
      "lon": latLng.longitude
    };

    var body = json.encode(data);


    var result = await http.post(
        // Uri.http('map.ir', '/reverse?lat=${latLng.latitude}&lon=${latLng.longitude}'),
        Uri.https(
            // 'map.ir', '/search/v2/autocomplete',
            'map.ir', '/search/v2',
            {'text': text}
        ),
        headers: headers,
        body: body
    );
    print(result.body);

    return SearchAddressResponse.fromJson(json.decode(result.body));
  }


  static Future<dynamic> sendMobileNumber(String phoneNumber, String code) async {
    Map data = {'MobileNumber': phoneNumber, 'Message': "ضمن تشکر از نصب برنامه، رمز ورود شما:  ${code} \n امداد خودرو سایپا\n "};

    var url = 'http://185.94.99.204:7252/api/Sms/Send';

    //encode Map to JSON
    var body = json.encode(data);

    // var result = await http.post(Uri.http('185.94.99.204:5252', '/api/Sms/Send'),
    var result = await http.post(Uri.http('185.94.99.204:7252', '/api/Sms/Send'), headers: {"Content-Type": "application/json"}, body: body);
    return result;
  }

  static Future<UrgentRequestResponse> sendUrgentRequest() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mobileNumber = preferences.getString('user_phone_number');
    SendUrgentRequest urgentModel = SendUrgentRequest(
      mobile: mobileNumber,
    );
    var body = json.encode(urgentModel.toJson());

    var result = await http.post(Uri.http('185.94.99.204:7252', '/api/Emdad/SendUrgentRequest'), headers: {"Content-Type": "application/json"}, body: body);
    var data = json.decode(result.body);
    var urgentData = UrgentRequestResponse.fromJson(data);
    return urgentData;
  }

  static Future<EmdadRequestResponse> sendEmdadRequest(GeoLocation geoLocation, String nationalCode, String chassicNo, int issueType) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var mobileNumber = preferences.getString('user_phone_number');
    SendEmdadRequest emdadModel = SendEmdadRequest(mobile: mobileNumber, geoLocation: geoLocation, nationalCode: nationalCode, chassisNo: chassicNo, issueType: issueType);
    var body = json.encode(emdadModel.toJson());

    var result = await http.post(Uri.http('185.94.99.204:7252', '/api/Emdad/SendRequest'), headers: {"Content-Type": "application/json"}, body: body);
    var data = json.decode(result.body);
    var emdadData = EmdadRequestResponse.fromJson(data);
    return emdadData;
  }

  static Future<GetPackagesResponse> getPackages(String chassicNo, int distanceTraveled) async {
    SendGetPackagesRequest getPackageModel = SendGetPackagesRequest(chassisNo: chassicNo, distanceTraveled: distanceTraveled);
    var body = json.encode(getPackageModel.toJson());
    var result = await http.post(Uri.http('185.94.99.204:7252', '/api/Emdad/GetPackages'), headers: {"Content-Type": "application/json"}, body: body);
    var data = json.decode(result.body);
    var packagesData = GetPackagesResponse.fromJson(data);
    return packagesData;
  }

  static Future<GetEmdadgarListResponse> getEmdadGarList(String packageGuid, GeoLocation geoLocation) async {
    SendGetEmdadgarList getEmdadGarList = SendGetEmdadgarList(packageGuid: packageGuid, geoLocation: geoLocation);
    var body = json.encode(getEmdadGarList.toJson());
    var result = await http.post(Uri.http('185.94.99.204:7252', '/api/Emdad/GetEmdadgarList'), headers: {"Content-Type": "application/json"}, body: body);
    var data = json.decode(result.body);
    var packagesData = GetEmdadgarListResponse.fromJson(data);
    return packagesData;
  }

  static Future<GetReservableDatesResponse> getReservableDates(List<String> packageItemsGuids, String emdadGarGuid, GeoLocation geoLocation) async {
    SendGetReservableRequest getReservableDates = SendGetReservableRequest(packageItemsGuids: packageItemsGuids, geoLocation: geoLocation, emdadgarGuid: emdadGarGuid);
    var body = json.encode(getReservableDates.toJson());
    var result = await http.post(Uri.http('185.94.99.204:7252', '/api/Emdad/GetReservableDates'), headers: {"Content-Type": "application/json"}, body: body);
    var data = json.decode(result.body);
    var packagesData = GetReservableDatesResponse.fromJson(data);
    return packagesData;
  }

  static Future<WeatherResponseModel> getWeather(LatLng latLng) async {

    var result = await http.get(
        Uri.https('api.openweathermap.org', '/data/2.5/onecall',
            {
              'lat': '35.74824655517203',
              'lon': '51.32812784980966',
              'appid': '4f1d07a9b56581b45eba0dd4e3d31c09',
              'lang': 'fa',
              'exclude': 'hourly',
              'units': 'metric',
            }
        ),
    );


    return WeatherResponseModel.fromJson(json.decode(result.body));
  }



  // new main server methods
  static Future<SendLoginOtp> sendLoginOtp(String mobileNumber) async {
    Map data = {
      'MobileNumber': mobileNumber
    };
    //encode Map to JSON
    var body = json.encode(data);

    var result = await http.post(
        Uri.http(mainServerUrl, '/api/User/SendLoginOtp'),
        headers: {"Content-Type": "application/json"},
        body: body
    );

    print(result.body);


    return SendLoginOtp.fromJson(json.decode(result.body));
  }

  static Future<Login> login(String otp) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    print('this is token ===> $token');

    Map data = {
      'Token': token,
      'OTP': otp
    };
    //encode Map to JSON
    var body = json.encode(data);

    var result = await http.post(
        Uri.http(mainServerUrl, '/api/User/Login'),
        headers: {"Content-Type": "application/json"},
        body: body
    );

    print(result.body);

    return Login.fromJson(json.decode(result.body));
  }

  static Future<Profile> getProfile() async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    Map data = {
      'Token': token
    };
    //encode Map to JSON
    var body = json.encode(data);

    var result = await http.post(
        Uri.http(mainServerUrl, '/api/User/GetProfile'),
        headers: {"Content-Type": "application/json"},
        body: body
    );




    return Profile.fromJson(json.decode(result.body));
  }

  static Future<MainServerGeneralResponse> editProfile(UserInfo userInfo) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    Map data = {
      'Token': token,
      'FirstName': userInfo.firstName,
      'LastName': userInfo.lastName,
      'NationalCode': userInfo.nationalCode
    };

    //encode Map to JSON
    var body = json.encode(data);

    var result = await http.post(
        Uri.http(mainServerUrl, '/api/User/EditProfile'),
        headers: {"Content-Type": "application/json"},
        body: body
    );




    return MainServerGeneralResponse.fromJson(json.decode(result.body));
  }

  static Future<MainServerGeneralResponse> submitCarInfo (CarInfo carInfo) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    Map data = {
      'Token': token,
      "Name": carInfo.Name,
      "ProductionYear": carInfo.ProductionYear,
      "LicensePlateNo": carInfo.LicensePlateNo,
      "ChassisNo": carInfo.ChassisNo,
      "Vin": carInfo.Vin
    };

    //encode Map to JSON
    var body = json.encode(data);

    var result = await http.post(
        Uri.http(mainServerUrl, '/api/User/SubmitCarInfo'),
        headers: {"Content-Type": "application/json"},
        body: body
    );




    return MainServerGeneralResponse.fromJson(json.decode(result.body));
  }

  // static Future<MainServerMessageResponse> sendUrgentRequest (CarInfo carInfo) async {
  //
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   String? token = sharedPreferences.getString('token');
  //
  //   Map data = {
  //     'Token': token,
  //     "Name": carInfo.Name,
  //     "ProductionYear": carInfo.ProductionYear,
  //     "LicensePlateNo": carInfo.LicensePlateNo,
  //     "ChassisNo": carInfo.ChassisNo,
  //     "Vin": carInfo.Vin
  //   };
  //
  //   //encode Map to JSON
  //   var body = json.encode(data);
  //
  //   var result = await http.post(
  //       Uri.http(mainServerUrl, '/api/Emdad/SendUrgentRequest'),
  //       headers: {"Content-Type": "application/json"},
  //       body: body
  //   );
  //
  //
  //
  //
  //   return MainServerGeneralResponse.fromJson(json.decode(result.body));
  // }




}
