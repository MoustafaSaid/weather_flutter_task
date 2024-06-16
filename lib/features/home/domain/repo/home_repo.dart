import 'package:dartz/dartz.dart';
import 'package:weather_flutter_task/core/network/failure/failure.dart';
import 'package:weather_flutter_task/features/home/data/models/weather_response_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, WeatherResponse>> getCurrentLocationWeather({
    required double lat,
    required double lon,
  });
  Future<Either<Failure, WeatherResponse>> getCityWeather({
    required String cityName,
  });
}
