import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/components/forecast.dart';
import 'package:weather_app/components/meteo_box.dart';
import 'package:weather_app/components/my_filter_box.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<List> getFilters(BuildContext context, Weather weather) {
    return [
      [
        Icons.thermostat,
        'max temp',
        '${weather.tempMax?.celsius?.toStringAsFixed(1)} °C',
      ],
      [Icons.air, 'wind', '${weather.windSpeed} km/h'],
      [Icons.water_drop_sharp, 'humidity', '${weather.humidity} %'],
      [
        Icons.wb_sunny_rounded,
        'sunrise',
        DateFormat().add_jm().format(weather.sunrise!),
      ]
    ];
  }

  List<List> forecasts = [
    [21, 'ThunderStorm', 'Friday 14'],
    [31, 'Clouds', 'Friday 14'],
    [13, 'Rainy', 'Friday 14'],
    [-13, 'Snow', 'Friday 14'],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0F1320), // Bleu très foncé presque noir en haut
                Color(0xFF0F1320), // Bleu très foncé presque noir en haut
                Color(0xFF0F1320), // Bleu très foncé presque noir en haut
                Color(0xFF0F1320), // Bleu très foncé presque noir en haut
                Color(0xFF0F1320), // Bleu très foncé presque noir en haut
                Color(0xFF161B2F), // Bleu foncé légèrement plus clair en bas
                // Color(0xFF0019FF), // Bleu foncé plus clair en bas
                Color(0xFF0F1320), // Bleu très foncé presque noir en haut
                Color(0xFF0F1320), // Bleu très foncé presque noir en haut
              ],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 13, 10, 10),
          child: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
              builder: (context, state) {
            if (state is WeatherBlocSuccess) {
              List<List> filters = getFilters(context, state.weather);
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //location's get
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${state.weather.areaName}",
                              style: const TextStyle(
                                  color: Color(0xffB7B7B7), fontSize: 15),
                            ),
                            const SizedBox(
                              height: 10,
                              child: Divider(
                                thickness: 2,
                                color: Color(0xff5D5D5D),
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.location_city,
                          color: Color.fromARGB(255, 86, 85, 85),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //meteo box to display temperature and time (cloudy, rainy, ...)
                        const MeteoBox(),

                        // const Spacer(),

                        //list of forecating
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Forecast(
                              temperature: forecasts[0][0],
                              weatherMain: forecasts[0][1],
                              day: forecasts[0][2],
                            ),
                            Forecast(
                              temperature: forecasts[1][0],
                              weatherMain: forecasts[1][1],
                              day: forecasts[1][2],
                            ),
                            Forecast(
                              temperature: forecasts[2][0],
                              weatherMain: forecasts[2][1],
                              day: forecasts[2][2],
                            ),
                            Forecast(
                              temperature: forecasts[3][0],
                              weatherMain: forecasts[3][1],
                              day: forecasts[3][2],
                            ),
                          ],
                        ),

                        // other arameters of the weather
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyFilterBox(
                                  icon: filters[0][0],
                                  text: filters[0][1],
                                  value: filters[0][2],
                                ),
                                MyFilterBox(
                                  icon: filters[1][0],
                                  text: filters[1][1],
                                  value: filters[1][2],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MyFilterBox(
                                  icon: filters[2][0],
                                  text: filters[2][1],
                                  value: filters[2][2],
                                ),
                                MyFilterBox(
                                  icon: filters[3][0],
                                  text: filters[3][1],
                                  value: filters[3][2],
                                ),
                              ],
                            ),
                          ],
                        ),

                        // const SizedBox(height: 3),

                        // GridView.builder(
                        //   gridDelegate:
                        //       const SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 2,
                        //     // childAspectRatio: 1 / .7,
                        //   ),
                        //   itemBuilder: (context, index) {
                        //     return MyFilterBox(
                        //       icon: filters[index][0],
                        //       text: filters[index][1],
                        //       value: filters[index][2],
                        //     );
                        //   },
                        //   itemCount: filters.length,
                        //   physics: const NeverScrollableScrollPhysics(),
                        //   padding: const EdgeInsets.all(8),
                        // ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}
