import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(primary: Colors.white),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _determinePosition(),
        builder: (context, snapshot) => snapshot.hasData
            ? BlocProvider<WeatherBlocBloc>(
                create: (context) => WeatherBlocBloc()
                  ..add(FetchWeather(snapshot.data as Position)),
                child: HomePage(),
              )
            : Scaffold(
                body: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(
                            0xFF0F1320), // Bleu très foncé presque noir en haut
                        Color(
                            0xFF0F1320), // Bleu très foncé presque noir en haut
                        Color(
                            0xFF0F1320), // Bleu très foncé presque noir en haut
                        Color(
                            0xFF0F1320), // Bleu très foncé presque noir en haut
                        Color(
                            0xFF0F1320), // Bleu très foncé presque noir en haut
                        Color(
                            0xFF161B2F), // Bleu foncé légèrement plus clair en bas
                        // Color(0xFF0019FF), // Bleu foncé plus clair en bas
                        Color(
                            0xFF0F1320), // Bleu très foncé presque noir en haut
                        Color(
                            0xFF0F1320), // Bleu très foncé presque noir en haut
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(5, 13, 10, 5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    Position position = await Geolocator.getCurrentPosition();
    // print('Position: ${position.latitude}, ${position.longitude}');
    return position;
  }
}
