import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_flutter_task/core/network/failure/failure.dart';
import 'package:weather_flutter_task/features/home/data/data_source/data_source.dart';
import 'package:weather_flutter_task/features/home/data/models/weather_response_model.dart';
import 'package:weather_flutter_task/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeDataSource homeDataSource;
  @override
  Future<Either<Failure, WeatherResponse>> getCityWeather({required String cityName}) async {
    try {
      final result = await homeDataSource.getCityWeather(cityName: cityName);
      return Right(result);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? ""));
    }
  }

  HomeRepoImpl({
    required this.homeDataSource,
  });

  @override
  Future<Either<Failure, WeatherResponse>> getCurrentLocationWeather(
      {required double lat, required double lon}) async {
    try {
      final result = await homeDataSource.getCurrentLocationWeather(location: "$lat,$lon");
      return Right(result);
    } on ServerFailure catch (e) {
      return Left(e);
    }
  }
}
