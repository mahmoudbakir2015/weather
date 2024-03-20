import 'package:weather/data/models/weather_model.dart';

import '../web_service/app_service.dart';

class AppRepo {
  AppWebService appWebService;
  AppRepo({required this.appWebService});
  Future<WeatherModel> getWeatherInfo({required String city}) async {
    return WeatherModel.fromJson(await appWebService.getWeatherInfo(
      city: city,
    ));
  }
}
