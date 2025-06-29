import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mo/cubits/grt_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_mo/cubits/grt_weather_cubit/get_weather_cubit_stats.dart';
import 'package:weather_app_mo/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, weatherstate>(
        builder: (context, state) {
          MaterialColor themeColor = Colors.grey; // اللون الافتراضي

          if (state is WeatherLoadedsState) {
            themeColor = getWeatherColor(state.weatherModel.weatherCondation);
          }

          return MaterialApp(
            theme: ThemeData(
              primarySwatch: themeColor,
              useMaterial3: false,
            ),
            home: HomeView(),
          );
        },
      ),
    );
  }
}

MaterialColor getWeatherColor(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.blue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'light rain':
    case 'patchy light rain':
    case 'light drizzle':
    case 'patchy light drizzle':
      return Colors.lightBlue;
    case 'moderate rain':
    case 'moderate rain at times':
    case 'moderate or heavy rain shower':
      return Colors.blue;
    case 'heavy rain':
    case 'heavy rain at times':
    case 'torrential rain shower':
    case 'moderate or heavy rain with thunder':
      return Colors.indigo;
    case 'patchy snow possible':
    case 'patchy light snow':
    case 'light snow':
    case 'light snow showers':
      return Colors.cyan;
    case 'moderate snow':
    case 'patchy moderate snow':
    case 'moderate or heavy snow showers':
    case 'patchy heavy snow':
    case 'heavy snow':
      return Colors.blueGrey;
    case 'blowing snow':
    case 'blizzard':
      return Colors.blueGrey;
    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate or heavy sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet showers':
      return Colors.cyan;
    case 'patchy freezing drizzle possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.teal;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepPurple;
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.blueGrey;
    default:
      return Colors.grey;
  }
}
