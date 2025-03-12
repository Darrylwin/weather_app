import 'package:flutter/material.dart';
import 'package:weather_app/components/forecasting.dart';
import 'package:weather_app/components/meteo_box.dart';

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
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
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
              ),
              SizedBox(height: 20),
              MeteoBox(),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Forecasting(),
                  Forecasting(),
                  Forecasting(),
                  Forecasting(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
