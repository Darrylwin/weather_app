import 'package:flutter/material.dart';

class MeteoBox extends StatelessWidget {
  const MeteoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      // height: MediaQuery.of(context).size.height * .40,
      width: MediaQuery.of(context).size.width * .75,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Image.asset(
            "assets/icons/png/day_wind.png",
            height: 110,
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
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Today',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Text(
            'Luck now',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
