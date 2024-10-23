
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:weathermachine/domain/repositories/weather_repository.dart';
import 'package:weathermachine/domain/usecases/get_weather_usecase.dart';

class HomePresenter extends Presenter {
  Function? getWeatherOnComplete;
  Function? getWeatherOnError;
  Function? getWeatherOnNext;

  final GetWeatherUsecase _getWeatherUseCase;

  HomePresenter(WeatherRepository homeRepository)
      : _getWeatherUseCase = GetWeatherUsecase(homeRepository);

  @override
  void dispose() {
    _getWeatherUseCase.dispose();
  }

  void getWeather() {
    _getWeatherUseCase.execute(
      _GetWeatherUseCaseObserver(this),
      GetWeatherUseCaseParams("")
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