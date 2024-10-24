
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:weathermachine/domain/repositories/weather_repository.dart';
import 'package:weathermachine/domain/usecases/get_hourly_forecast.dart';
import 'package:weathermachine/domain/usecases/get_weather_usecase.dart';

class HomePresenter extends Presenter {
  Function? getWeatherOnComplete;
  Function? getWeatherOnError;
  Function? getWeatherOnNext;

  Function? getHourlyForecastOnComplete;
  Function? getHourlyForecastOnError;
  Function? getHourlyForecastOnNext;

  final GetWeatherUsecase _getWeatherUseCase;
  final GetHourlyForecastUsecase _getHourlyForecastUsecase;

  HomePresenter(WeatherRepository homeRepository)
      : _getWeatherUseCase = GetWeatherUsecase(homeRepository),
      _getHourlyForecastUsecase = GetHourlyForecastUsecase(homeRepository)
      ;

  @override
  void dispose() {
    _getWeatherUseCase.dispose();
    _getHourlyForecastUsecase.dispose();
  }

  void getWeather() {
    _getWeatherUseCase.execute(
      _GetWeatherUseCaseObserver(this),
      GetWeatherUseCaseParams("")
    );
  }

  void getHourlyForecast() {
    _getHourlyForecastUsecase.execute(
      _GetHourlyForecastUseCaseObserver(this),
      GetHourlyForecastUseCaseParams("")
    );
  }
}

class _GetWeatherUseCaseObserver
  implements Observer<GetWeatherUseCaseResponse> {
  final HomePresenter presenter;
  _GetWeatherUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getWeatherOnComplete != null);
    presenter.getWeatherOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getWeatherOnError != null);
    presenter.getWeatherOnError!(e);
  }

  @override
  void onNext(GetWeatherUseCaseResponse? response) {
    assert(presenter.getWeatherOnNext != null);
    presenter.getWeatherOnNext!(response!.weather);
  }

}

class _GetHourlyForecastUseCaseObserver
  implements Observer<GetHourlyForecastUseCaseResponse> {
  final HomePresenter presenter;
  _GetHourlyForecastUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getHourlyForecastOnComplete != null);
    presenter.getHourlyForecastOnComplete!();
  }

  @override
  void onError(e) {
    assert(presenter.getHourlyForecastOnError != null);
    presenter.getHourlyForecastOnError!(e);
  }

  @override
  void onNext(GetHourlyForecastUseCaseResponse? response) {
    assert(presenter.getHourlyForecastOnNext != null);
    presenter.getHourlyForecastOnNext!(response!.weather);
  }

}