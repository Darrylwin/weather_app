import 'package:flutter/material.dart';

class MyFilterBox extends StatelessWidget {
  const MyFilterBox({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  final IconData? icon;
  final String text;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 73,
        width: 125,
        decoration: const BoxDecoration(
          color: Color(0xff1E1D2B),
          borderRadius: BorderRadius.all(Radius.circular(35)),
        ),
        padding: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(icon),
                  const SizedBox(height: 5),
                  Text(
                    text,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                value,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
