import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/states/weather_state.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherLoading());

  Future<void> fetchWeather(String cityName) async {
    WeatherService weatherService = WeatherService();

    emit(WeatherLoading());
    try {
      WeatherModel weatherModel =
          await weatherService.fetchWeatherInformation(cityName);
      emit(
        WeatherLoaded(weatherModel: weatherModel),
      );
    } catch (e) {
      emit(WeatherError());
    }
  }
}
