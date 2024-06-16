import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'weather_response_model.g.dart';

@JsonSerializable()
class WeatherResponse extends Equatable {
  final Location? location;
  final Current? current;
  final Forecast? forecast;

  const WeatherResponse({this.location, this.current, this.forecast});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  @override
  List<Object?> get props => [location, current, forecast];
}

@JsonSerializable()
class Location extends Equatable {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  @JsonKey(name: 'tz_id')
  final String? tzId;
  @JsonKey(name: 'localtime_epoch')
  final int? localtimeEpoch;
  final String? localtime;

  const Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  List<Object?> get props => [name, region, country, lat, lon, tzId, localtimeEpoch, localtime];
}

@JsonSerializable()
class Current extends Equatable {
  @JsonKey(name: 'last_updated_epoch')
  final int? lastUpdatedEpoch;
  @JsonKey(name: 'last_updated')
  final String? lastUpdated;
  @JsonKey(name: 'temp_c')
  final double? tempC;
  @JsonKey(name: 'temp_f')
  final double? tempF;
  @JsonKey(name: 'is_day')
  final int? isDay;
  final Condition? condition;
  @JsonKey(name: 'wind_mph')
  final double? windMph;
  @JsonKey(name: 'wind_kph')
  final double? windKph;
  @JsonKey(name: 'wind_degree')
  final int? windDegree;
  @JsonKey(name: 'wind_dir')
  final String? windDir;
  @JsonKey(name: 'pressure_mb')
  final double? pressureMb;
  @JsonKey(name: 'pressure_in')
  final double? pressureIn;
  @JsonKey(name: 'precip_mm')
  final double? precipMm;
  @JsonKey(name: 'precip_in')
  final double? precipIn;
  final int? humidity;
  final int? cloud;
  @JsonKey(name: 'feelslike_c')
  final double? feelslikeC;
  @JsonKey(name: 'feelslike_f')
  final double? feelslikeF;
  @JsonKey(name: 'windchill_c')
  final double? windchillC;
  @JsonKey(name: 'windchill_f')
  final double? windchillF;
  @JsonKey(name: 'heatindex_c')
  final double? heatindexC;
  @JsonKey(name: 'heatindex_f')
  final double? heatindexF;
  @JsonKey(name: 'dewpoint_c')
  final double? dewpointC;
  @JsonKey(name: 'dewpoint_f')
  final double? dewpointF;
  @JsonKey(name: 'vis_km')
  final double? visKm;
  @JsonKey(name: 'vis_miles')
  final double? visMiles;
  final double? uv;
  @JsonKey(name: 'gust_mph')
  final double? gustMph;
  @JsonKey(name: 'gust_kph')
  final double? gustKph;

  const Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);

  @override
  List<Object?> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        windchillC,
        windchillF,
        heatindexC,
        heatindexF,
        dewpointC,
        dewpointF,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph,
      ];
}

@JsonSerializable()
class Condition extends Equatable {
  final String? text;
  final String? icon;
  final int? code;

  const Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);

  @override
  List<Object?> get props => [text, icon, code];
}

@JsonSerializable()
class Forecast extends Equatable {
  final List<ForecastDay>? forecastday;

  const Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) => _$ForecastFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);

  @override
  List<Object?> get props => [forecastday];
}

@JsonSerializable()
class ForecastDay extends Equatable {
  final String? date;
  @JsonKey(name: 'date_epoch')
  final int? dateEpoch;
  final Day? day;
  final Astro? astro;
  final List<Hour>? hour;

  const ForecastDay({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  factory ForecastDay.fromJson(Map<String, dynamic> json) => _$ForecastDayFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);

  @override
  List<Object?> get props => [date, dateEpoch, day, astro, hour];
}

@JsonSerializable()
class Day extends Equatable {
  @JsonKey(name: 'maxtemp_c')
  final double? maxTempC;
  @JsonKey(name: 'maxtemp_f')
  final double? maxTempF;
  @JsonKey(name: 'mintemp_c')
  final double? minTempC;
  @JsonKey(name: 'mintemp_f')
  final double? minTempF;
  @JsonKey(name: 'avgtemp_c')
  final double? avgTempC;
  @JsonKey(name: 'avgtemp_f')
  final double? avgTempF;
  @JsonKey(name: 'maxwind_mph')
  final double? maxWindMph;
  @JsonKey(name: 'maxwind_kph')
  final double? maxWindKph;
  @JsonKey(name: 'totalprecip_mm')
  final double? totalPrecipMm;
  @JsonKey(name: 'totalprecip_in')
  final double? totalPrecipIn;
  @JsonKey(name: 'totalsnow_cm')
  final double? totalSnowCm;
  @JsonKey(name: 'avgvis_km')
  final double? avgVisKm;
  @JsonKey(name: 'avgvis_miles')
  final double? avgVisMiles;
  @JsonKey(name: 'avghumidity')
  final int? avgHumidity;
  @JsonKey(name: 'daily_will_it_rain')
  final int? dailyWillItRain;
  @JsonKey(name: 'daily_chance_of_rain')
  final int? dailyChanceOfRain;
  @JsonKey(name: 'daily_will_it_snow')
  final int? dailyWillItSnow;
  @JsonKey(name: 'daily_chance_of_snow')
  final int? dailyChanceOfSnow;
  final Condition? condition;
  final double? uv;

  const Day({
    this.maxTempC,
    this.maxTempF,
    this.minTempC,
    this.minTempF,
    this.avgTempC,
    this.avgTempF,
    this.maxWindMph,
    this.maxWindKph,
    this.totalPrecipMm,
    this.totalPrecipIn,
    this.totalSnowCm,
    this.avgVisKm,
    this.avgVisMiles,
    this.avgHumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);

  @override
  List<Object?> get props => [
        maxTempC,
        maxTempF,
        minTempC,
        minTempF,
        avgTempC,
        avgTempF,
        maxWindMph,
        maxWindKph,
        totalPrecipMm,
        totalPrecipIn,
        totalSnowCm,
        avgVisKm,
        avgVisMiles,
        avgHumidity,
        dailyWillItRain,
        dailyChanceOfRain,
        dailyWillItSnow,
        dailyChanceOfSnow,
        condition,
        uv,
      ];
}

@JsonSerializable()
class Astro extends Equatable {
  final String? sunrise;
  final String? sunset;
  final String? moonrise;
  final String? moonset;
  @JsonKey(name: 'moon_phase')
  final String? moonPhase;
  @JsonKey(name: 'moon_illumination')
  final int? moonIllumination;
  @JsonKey(name: 'is_moon_up')
  final int? isMoonUp;
  @JsonKey(name: 'is_sun_up')
  final int? isSunUp;

  const Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => _$AstroFromJson(json);

  Map<String, dynamic> toJson() => _$AstroToJson(this);

  @override
  List<Object?> get props =>
      [sunrise, sunset, moonrise, moonset, moonPhase, moonIllumination, isMoonUp, isSunUp];
}

@JsonSerializable()
class Hour extends Equatable {
  @JsonKey(name: 'time_epoch')
  final int? timeEpoch;
  final String? time;
  @JsonKey(name: 'temp_c')
  final double? tempC;
  @JsonKey(name: 'temp_f')
  final double? tempF;
  @JsonKey(name: 'is_day')
  final int? isDay;
  final Condition? condition;
  @JsonKey(name: 'wind_mph')
  final double? windMph;
  @JsonKey(name: 'wind_kph')
  final double? windKph;
  @JsonKey(name: 'wind_degree')
  final int? windDegree;
  @JsonKey(name: 'wind_dir')
  final String? windDir;
  @JsonKey(name: 'pressure_mb')
  final double? pressureMb;
  @JsonKey(name: 'pressure_in')
  final double? pressureIn;
  @JsonKey(name: 'precip_mm')
  final double? precipMm;
  @JsonKey(name: 'precip_in')
  final double? precipIn;
  @JsonKey(name: 'snow_cm')
  final double? snowCm;
  final int? humidity;
  final int? cloud;
  @JsonKey(name: 'feelslike_c')
  final double? feelslikeC;
  @JsonKey(name: 'feelslike_f')
  final double? feelslikeF;
  @JsonKey(name: 'windchill_c')
  final double? windchillC;
  @JsonKey(name: 'windchill_f')
  final double? windchillF;
  @JsonKey(name: 'heatindex_c')
  final double? heatindexC;
  @JsonKey(name: 'heatindex_f')
  final double? heatindexF;
  @JsonKey(name: 'dewpoint_c')
  final double? dewpointC;
  @JsonKey(name: 'dewpoint_f')
  final double? dewpointF;
  @JsonKey(name: 'will_it_rain')
  final int? willItRain;
  @JsonKey(name: 'chance_of_rain')
  final int? chanceOfRain;
  @JsonKey(name: 'will_it_snow')
  final int? willItSnow;
  @JsonKey(name: 'chance_of_snow')
  final int? chanceOfSnow;
  @JsonKey(name: 'vis_km')
  final double? visKm;
  @JsonKey(name: 'vis_miles')
  final double? visMiles;
  final double? uv;
  @JsonKey(name: 'gust_mph')
  final double? gustMph;
  @JsonKey(name: 'gust_kph')
  final double? gustKph;

  const Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.snowCm,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => _$HourFromJson(json);

  Map<String, dynamic> toJson() => _$HourToJson(this);

  @override
  List<Object?> get props => [
        timeEpoch,
        time,
        tempC,
        tempF,
        isDay,
        condition,
        windMph,
        windKph,
        windDegree,
        windDir,
        pressureMb,
        pressureIn,
        precipMm,
        precipIn,
        snowCm,
        humidity,
        cloud,
        feelslikeC,
        feelslikeF,
        windchillC,
        windchillF,
        heatindexC,
        heatindexF,
        dewpointC,
        dewpointF,
        willItRain,
        chanceOfRain,
        willItSnow,
        chanceOfSnow,
        visKm,
        visMiles,
        uv,
        gustMph,
        gustKph,
      ];
}
