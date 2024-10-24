import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathermachine/domain/entities/hourly_weather.dart';
import 'package:weathermachine/domain/repositories/weather_repository.dart';

class GetHourlyForecastUsecase
    extends UseCase<GetHourlyForecastUseCaseResponse, GetHourlyForecastUseCaseParams> {
  final WeatherRepository weatherRepository;
  GetHourlyForecastUsecase(this.weatherRepository);

  @override
  Future<Stream<GetHourlyForecastUseCaseResponse?>> buildUseCaseStream(
      GetHourlyForecastUseCaseParams? params) async {
    final stream = StreamController<GetHourlyForecastUseCaseResponse>();

    try {
      Position position = await weatherRepository.getCurrentLocation();
      HourlyWeather weather =  await weatherRepository.getHourlyForecast(position.latitude, position.longitude);
      stream.add(GetHourlyForecastUseCaseResponse(weather));
    } catch (e) {
      stream.addError(e);
    }
    return stream.stream;
  }
}

class GetHourlyForecastUseCaseResponse {
  final HourlyWeather weather;
  GetHourlyForecastUseCaseResponse(this.weather);
}

class GetHourlyForecastUseCaseParams {
  final String greeting;
  GetHourlyForecastUseCaseParams(this.greeting);
}