import 'package:equatable/equatable.dart';
import 'package:weather_flutter_task/core/request_states.dart';
import 'package:weather_flutter_task/features/home/data/models/weather_response_model.dart';

class HomeStates extends Equatable {
  // final RequestStates getWeatherState;
  final ThemeState themeState;
  final RequestStates getCityWeatherState;
  final WeatherResponse? weatherResponse;

  final String? error;
  final RequestStates getLocationState;
  final double lat;
  final double lon;

  @override
  List<Object?> get props => [
        // getWeatherState,
        getCityWeatherState,
        weatherResponse,
        error,
        getLocationState,
        lat,
        lon,
        themeState
      ];

  const HomeStates(
      {
      // this.getWeatherState = RequestStates.loading,
      this.getCityWeatherState = RequestStates.loading,
      this.themeState = ThemeState.light,
      this.weatherResponse,
      this.error,
      this.lon = 31.233334,
      this.lat = 30.033333,
      this.getLocationState = RequestStates.loading});

  HomeStates copyWith(
      {
      // RequestStates? getWeatherState,
      RequestStates? getCityWeatherState,
      RequestStates? getLocationState,
      WeatherResponse? weatherResponse,
      ThemeState? themeState,
      String? error,
      double? lat,
      double? lon}) {
    return HomeStates(
      // getWeatherState: getWeatherState ?? this.getWeatherState,
      getCityWeatherState: getCityWeatherState ?? this.getCityWeatherState,
      weatherResponse: weatherResponse ?? this.weatherResponse,
      error: error ?? this.error,
      getLocationState: getLocationState ?? this.getLocationState,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      themeState: themeState ?? this.themeState,
    );
  }
}

enum ThemeState { light, dark }
