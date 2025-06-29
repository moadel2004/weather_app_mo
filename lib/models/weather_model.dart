class WeatherModel {
  final String cityName;
  final  DateTime date;
  final double temp;
  final String? image;
  final double mintemp;
  final double maxtemp;
  final String weatherCondation;
  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.temp,
      this.image,
      required this.mintemp,
      required this.maxtemp,
      required this.weatherCondation});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition'] ['icon'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated'],),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        weatherCondation: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
