import 'package:weathermachine/domain/entities/weather.dart';

abstract class WeatherRepository {
  Weather getGreetings(String greeting);
}