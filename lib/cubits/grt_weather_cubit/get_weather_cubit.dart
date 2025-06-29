import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mo/cubits/grt_weather_cubit/get_weather_cubit_stats.dart';
import 'package:weather_app_mo/models/weather_model.dart';
import 'package:weather_app_mo/services/weather_service.dart';
import 'package:weather_app_mo/views/search_veiw.dart';

class GetWeatherCubit extends Cubit<weatherstate> {
  GetWeatherCubit() : super(weatherInitialstate());
 late WeatherModel weatherModel;
  getWeather(String CityName) async {
    try {
       weatherModel =
          await WeatherService(dio: Dio()).getcurrentweather(CityName);
      emit(WeatherLoadedsState(weatherModel: weatherModel));
    } catch (e) {
      emit(weatherFailurestate(e.toString()));
    }
  }
}
