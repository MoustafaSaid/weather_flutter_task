import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_flutter_task/core/constants/strings_constatnts.dart';
import 'package:weather_flutter_task/features/home/data/models/weather_model.dart';

part 'data_source.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/")
abstract class HomeDataSource {
  factory HomeDataSource(Dio dio, {String baseUrl}) = _HomeDataSource;

  @GET("data/3.0/onecall&appid=${StringsConstants.apiKey}")
  Future<WeatherResponse> getCurrentLocationWeather({
    @Query("lat") required double lat,
    @Query("lon") required double lon,
  });
  @GET("geo/1.0/direct?&appid=${StringsConstants.apiKey}")
  Future<WeatherResponse> getCityWeather({
    @Query("q") required String cityName,
  });
}
