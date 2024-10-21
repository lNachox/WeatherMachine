import 'package:weathermachine/domain/entities/weather.dart';
import 'package:weathermachine/domain/repositories/weather_repository.dart';

class DataWeatherRepository implements WeatherRepository {


  @override
  Weather getGreetings(String greeting) {
    try {
      return Weather(greeting: greeting);
    } catch (error, stackTrace) {
      rethrow;
    }
  }

}