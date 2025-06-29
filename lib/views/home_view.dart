import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_mo/cubits/grt_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_mo/cubits/grt_weather_cubit/get_weather_cubit_stats.dart';
import 'package:weather_app_mo/widgets/no_weather_body.dart';
import 'package:weather_app_mo/widgets/weather_info_body.dart';
import 'package:weather_app_mo/views/search_veiw.dart'; // Import the SearchView class

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SearchVeiw();
                  }));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, weatherstate>(
            builder: (context, state) {
          if (state is weatherInitialstate) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedsState) {
            return WeatherInfoBody();
          } else {
            return Center(child: Text('Failed to fetch weather data'));
          }
        }));
  }
}
//ploc pattern steps
// create states 
// create cubit
// create functions
//provide the cubit
//integrate the cubit 
//trigger the cubit
