import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forecast extends StatelessWidget {
  const Forecast({
    super.key,
    required this.temperature,
    required this.weatherMain,
    required this.day,
  });

  final int temperature;
  final String weatherMain;
  final String day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      width: 73,
      decoration: const BoxDecoration(
        color: Color(0xff1E1D2B),
        borderRadius: BorderRadius.all(
          Radius.circular(37.27),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            "assets/icons/png/day_cloud.png",
            height: 25,
          ),
          Text(
            '$temperature °C',
            style: GoogleFonts.lato(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            maxLines: 1,
            weatherMain,
            style: GoogleFonts.robotoCondensed(
              fontSize: 11.5,
              fontWeight: FontWeight.w400,
            ),
            // overflow: TextOverflow.fade,
          ),
          const SizedBox(height: 8),
          Text(
            day,
            maxLines: 1,
            style: GoogleFonts.redRose(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
