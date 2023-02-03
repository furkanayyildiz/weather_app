import 'package:flutter_bloc/flutter_bloc.dart';
import './weather_state.dart';

// page import
import '../service/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    if (cityName != null) {
      emit(state.copyWith(status: WeatherStatus.inital));
      await Future.delayed(const Duration(seconds: 1));
      final response = await weatherService.fetchWeather(cityName);

      if (response == null) {
        emit(WeatherError("Errorr"));
      }
      emit(WeatherCompleted());
      return emit(
          state.copyWith(response: response, status: WeatherStatus.success));
    } else {
      emit(state.copyWith(status: WeatherStatus.error));
    }
  }
}
