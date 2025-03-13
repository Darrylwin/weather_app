import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Forecasting extends StatelessWidget {
  const Forecasting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: 60,
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
          const Text(
            '16°',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'cloudy',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Today',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            'Luck now',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
