import 'dart:developer';

import 'package:dio/dio.dart';

import '../../constants/key.dart';
import '../../helpers/dio_helper.dart';

class AppWebService {
  Future<dynamic> getWeatherInfo({required String city}) async {
    Response response = await DioHelper.getData(
      endPoint:
          'http://api.weatherapi.com/v1/current.json?key=${Keys.apiWeatherKey}&q=$city&aqi=no',
    );
    try {
      log(response.data.toString());
      return response.data;
    } catch (e) {
      log(e.toString());
    }
  }
}
