import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_mo/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '6d192fd2555940b288c144640251501';
  WeatherService({required this.dio});
  Future<WeatherModel> getcurrentweather(String cityName) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? 'oops something went wrong';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops something went wrong');
    }
  }
}
//