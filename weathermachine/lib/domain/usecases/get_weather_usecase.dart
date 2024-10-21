import 'dart:async';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
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
      final Weather example =
          await weatherRepository.getGreetings(params!.greeting);
      stream.add(GetWeatherUseCaseResponse(example));
    } catch (e) {
      stream.addError(e);
    }
    return stream.stream;
  }
}

class GetWeatherUseCaseResponse {
  final Weather example;
  GetWeatherUseCaseResponse(this.example);
}

class GetWeatherUseCaseParams {
  final String greeting;
  GetWeatherUseCaseParams(this.greeting);
}
