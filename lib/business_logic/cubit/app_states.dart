import '../../data/models/weather_model.dart';

abstract class AppeStates {}

class InitialState extends AppeStates {}

class SuccessedWeatherState extends AppeStates {
  final WeatherModel weatherModel;

  SuccessedWeatherState({
    required this.weatherModel,
  });
}

class FailedWeatherState extends AppeStates {
  final String errorMessage;

  FailedWeatherState({
    required this.errorMessage,
  });
}
