import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                Color(0xFF161B2F), // Bleu foncé légèrement plus clair en bas
              ],
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Location",
                          style:
                              TextStyle(color: Color(0xffB7B7B7), fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                          child: Divider(
                            thickness: 2,
                            color: Color(0xff5D5D5D),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.location_city,
                      color: Color.fromARGB(255, 86, 85, 85),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
