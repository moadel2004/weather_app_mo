import 'package:weather_app_mo/models/weather_model.dart';

class weatherInitialstate extends weatherstate {}

class WeatherLoadedsState extends weatherstate {
  final WeatherModel weatherModel;
  WeatherLoadedsState({required this.weatherModel});
}

class weatherFailurestate extends weatherstate {
  final String errorMessage;
  weatherFailurestate(this.errorMessage);
}

class weatherstate {
  get weatherModel => null;
}
