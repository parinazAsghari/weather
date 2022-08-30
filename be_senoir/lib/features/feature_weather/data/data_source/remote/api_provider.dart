import 'package:be_senoir/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();

  var apiKey = Constants.apiKey1;

 Future<dynamic> getCurrentWeather(String cityName) async {
   var response = await _dio.get(
      '${Constants.baseUrl}/data/2.5/weather',
      queryParameters:{
        'q':cityName,
        'appid': apiKey,
        'units':'metric',
      }
    );
   return response;
  }
}