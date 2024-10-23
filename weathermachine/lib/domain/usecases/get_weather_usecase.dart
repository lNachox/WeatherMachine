import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weathermachine/domain/entities/weather.dart';
import 'package:weathermachine/domain/repositories/weather_repository.dart';

class GetWeatherUsecase
    extends UseCase<GetWeatherUseCaseResponse, GetWeatherUseCaseParams> {
  final WeatherRepository weatherRepository;
  GetWeatherUsecase(this.weatherRepository);

  @override
  Future<Stream<GetWeatherUseCaseResponse?>> buildUseCaseStream(
      GetWeatherUseCaseParams? params) async {
    final stream = StreamController<GetWeatherUseCaseResponse>();

    try {
      Position position = await weatherRepository.getCurrentLocation();
      Weather weather =  await weatherRepository.getWeather(position.latitude, position.longitude);
      stream.add(GetWeatherUseCaseResponse(weather));
    } catch (e) {
      stream.addError(e);
    }
    return stream.stream;
  }
}

class GetWeatherUseCaseResponse {
  final Weather weather;
  GetWeatherUseCaseResponse(this.weather);
}

class GetWeatherUseCaseParams {
  final String greeting;
  GetWeatherUseCaseParams(this.greeting);
}
