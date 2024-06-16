// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:weather_flutter_task/core/constants/strings_constatnts.dart';
// import 'package:weather_flutter_task/features/home/data/models/weather_model.dart';
//
// part 'data_source.g.dart';
//
// @RestApi(baseUrl: "https://api.openweathermap.org/")
// abstract class HomeDataSource {
//   factory HomeDataSource(Dio dio, {String baseUrl}) = _HomeDataSource;
//
//   @GET("data/3.0/onecall&appid=${StringsConstants.apiKey}")
//   Future<WeatherResponse> getCurrentLocationWeather({
//     @Query("lat") required double lat,
//     @Query("lon") required double lon,
//   });
//   @GET("geo/1.0/direct?&appid=${StringsConstants.apiKey}")
//   Future<WeatherResponse> getCityWeather({
//     @Query("q") required String cityName,
//   });
// }
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_flutter_task/core/constants/strings_constatnts.dart';
import 'package:weather_flutter_task/features/home/data/models/weather_response_model.dart';

part 'data_source.g.dart';

@RestApi(baseUrl: "https://api.weatherapi.com/v1/")
abstract class HomeDataSource {
  factory HomeDataSource(Dio dio, {String baseUrl}) = _HomeDataSource;

  @GET("forecast.json?key=${StringsConstants.apiKey}&days=8&aqi=no&alerts=no")
  Future<WeatherResponse> getCurrentLocationWeather({
    @Query("q") required String location,
  });
  @GET("forecast.json?key=${StringsConstants.apiKey}&days=8&aqi=no&alerts=no")
  Future<WeatherResponse> getCityWeather({
    @Query("q") required String cityName,
  });
}
// https://api.weatherapi.com/v1/forecast.json?key=aeb7049c37c44deda43100845241306&q=30,30&days=2&aqi=no&alerts=no
