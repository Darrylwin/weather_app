import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MeteoBox extends StatelessWidget {
  const MeteoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff01000B),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border(
          top: BorderSide(color: Colors.grey[600]!),
          left: BorderSide(color: Colors.grey[600]!),
        ),
      ),
      // height: MediaQuery.of(context).size.height * .40,
      width: MediaQuery.of(context).size.width * .75,
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/day_cloud.svg",
            height: 100,
          ),
          const Text(
            '18°',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'cloudy',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            'Luck now',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
