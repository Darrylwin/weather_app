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
      height: MediaQuery.of(context).size.height * .40,
      width: MediaQuery.of(context).size.width * .78,
      child: SvgPicture.asset(
        "assets/icons/day_cloud.svg",
        placeholderBuilder: (BuildContext context) => const SizedBox(
          height: 150,
          width: 150,
          child: Center(child: Text('Erreur de chargement SVG')),
        ),
        height: 150,
      ),
    );
  }
}
