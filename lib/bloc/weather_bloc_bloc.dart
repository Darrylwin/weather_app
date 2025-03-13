import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/data/my_data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory weatherFactory = WeatherFactory(
          API_KEY,
          language: Language.ENGLISH,
        );
        Weather weather = await weatherFactory.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        // print('\n\nWeather details: $weather\n\n');
        emit(WeatherBlocSuccess(weather));
      } catch (e) {
        // print('\n\nError fetching weather: $e\n\n');
        emit(WeatherBlocFailure());
      }
    });
  }
}
