import 'package:flutter/material.dart';

class MyFilterBox extends StatelessWidget {
  const MyFilterBox({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 58.8,
        width: 110,
        decoration: const BoxDecoration(
          color: Color(0xff1E1D2B),
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon),
              // const SizedBox(height: 5),
              Text(
                text,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
