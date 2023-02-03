import '../model/weather_model.dart';

enum WeatherStatus {
  inital,
  loading,
  success,
  error,
}

class WeatherState {
  final WeatherModel? response;
  final WeatherStatus status;

  const WeatherState({this.response, this.status = WeatherStatus.inital});

  copyWith({
    WeatherModel? response,
    WeatherStatus? status,
  }) {
    return WeatherState(
      response: response ?? this.response,
      status: status ?? this.status,
    );
  }
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
}

class WeatherCompleted extends WeatherState {}

class WeatherError extends WeatherState {
  final String message;

  const WeatherError(this.message);
}
