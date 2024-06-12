import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'weather_model.g.dart';

@JsonSerializable()
class WeatherResponse extends Equatable {
  final double? lat;
  final double? lon;
  final String? timezone;
  @JsonKey(name: 'timezone_offset')
  final int? timezoneOffset;
  final Current? current;
  final List<Minutely>? minutely;
  final List<Hourly>? hourly;
  final List<Daily>? daily;
  final List<Alert>? alerts;

  WeatherResponse({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
    this.alerts,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) => _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  @override
  List<Object?> get props =>
      [lat, lon, timezone, timezoneOffset, current, minutely, hourly, daily, alerts];
}

@JsonSerializable()
class Current extends Equatable {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final double? temp;
  @JsonKey(name: 'feels_like')
  final double? feelsLike;
  final int? pressure;
  final int? humidity;
  @JsonKey(name: 'dew_point')
  final double? dewPoint;
  final double? uvi;
  final int? clouds;
  final int? visibility;
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @JsonKey(name: 'wind_deg')
  final int? windDeg;
  @JsonKey(name: 'wind_gust')
  final double? windGust;
  final List<Weather>? weather;

  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
  });

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        uvi,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        windGust,
        weather
      ];
}

@JsonSerializable()
class Minutely extends Equatable {
  final int? dt;
  final double? precipitation;

  Minutely({
    this.dt,
    this.precipitation,
  });

  factory Minutely.fromJson(Map<String, dynamic> json) => _$MinutelyFromJson(json);

  Map<String, dynamic> toJson() => _$MinutelyToJson(this);

  @override
  List<Object?> get props => [dt, precipitation];
}

@JsonSerializable()
class Hourly extends Equatable {
  final int? dt;
  final double? temp;
  @JsonKey(name: 'feels_like')
  final double? feelsLike;
  final int? pressure;
  final int? humidity;
  @JsonKey(name: 'dew_point')
  final double? dewPoint;
  final double? uvi;
  final int? clouds;
  final int? visibility;
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @JsonKey(name: 'wind_deg')
  final int? windDeg;
  @JsonKey(name: 'wind_gust')
  final double? windGust;
  final List<Weather>? weather;
  final double? pop;

  Hourly({
    this.dt,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.pop,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyToJson(this);

  @override
  List<Object?> get props => [
        dt,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        uvi,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        windGust,
        weather,
        pop
      ];
}

@JsonSerializable()
class Daily extends Equatable {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final int? moonrise;
  final int? moonset;
  @JsonKey(name: 'moon_phase')
  final double? moonPhase;
  final String? summary;
  final Temp? temp;
  @JsonKey(name: 'feels_like')
  final FeelsLike? feelsLike;
  final int? pressure;
  final int? humidity;
  @JsonKey(name: 'dew_point')
  final double? dewPoint;
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;
  @JsonKey(name: 'wind_deg')
  final int? windDeg;
  @JsonKey(name: 'wind_gust')
  final double? windGust;
  final List<Weather>? weather;
  final int? clouds;
  final double? pop;
  final double? rain;
  final double? uvi;

  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.summary,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.rain,
    this.uvi,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);

  @override
  List<Object?> get props => [
        dt,
        sunrise,
        sunset,
        moonrise,
        moonset,
        moonPhase,
        summary,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        windSpeed,
        windDeg,
        windGust,
        weather,
        clouds,
        pop,
        rain,
        uvi
      ];
}

@JsonSerializable()
class Temp extends Equatable {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;

  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);

  @override
  List<Object?> get props => [day, min, max, night, eve, morn];
}

@JsonSerializable()
class FeelsLike extends Equatable {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;

  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);

  @override
  List<Object?> get props => [day, night, eve, morn];
}

@JsonSerializable()
class Weather extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  @override
  List<Object?> get props => [id, main, description, icon];
}

@JsonSerializable()
class Alert extends Equatable {
  @JsonKey(name: 'sender_name')
  final String? senderName;
  final String? event;
  final int? start;
  final int? end;
  final String? description;
  final List<String>? tags;

  Alert({
    this.senderName,
    this.event,
    this.start,
    this.end,
    this.description,
    this.tags,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

  Map<String, dynamic> toJson() => _$AlertToJson(this);

  @override
  List<Object?> get props => [senderName, event, start, end, description, tags];
}
