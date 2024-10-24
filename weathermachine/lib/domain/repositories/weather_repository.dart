import 'package:geolocator/geolocator.dart';
import 'package:weathermachine/domain/entities/hourly_weather.dart';
import 'package:weathermachine/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Position> getCurrentLocation();
  Future<Weather> getWeather(double lat, double lon);
  Future<HourlyWeather> getHourlyForecast(double lat, double lon);
}