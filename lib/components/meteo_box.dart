import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';

class MeteoBox extends StatelessWidget {
  const MeteoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xff01031C),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border(
                    top: BorderSide(color: Colors.grey[600]!),
                    left: BorderSide(color: Colors.grey[600]!),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 7,
                      spreadRadius: 2.5,
                      offset: Offset(1, 3),
                    ),
                  ]),
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width * .75,
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  Image.asset(
                    "assets/icons/png/day_wind.png",
                    height: 110,
                  ),
                  const Spacer(),
                  Text(
                    '${state.weather.temperature!.celsius!.round()} °c',
                    style: GoogleFonts.lato(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${state.weather.weatherMain}',
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    DateFormat('EEEE dd').add_jm().format(state.weather.date!),
                    style: GoogleFonts.redRose(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
