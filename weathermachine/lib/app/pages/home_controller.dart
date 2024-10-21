
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:weathermachine/app/pages/home_presenter.dart';
import 'package:weathermachine/data/remote/data_weather_repository.dart';
import 'package:weathermachine/domain/entities/weather.dart';

class HomeController extends Controller {
  final HomePresenter presenter;
  Weather? weather;

  HomeController(
      DataWeatherRepository dataHomeRepository
      ): presenter = HomePresenter(dataHomeRepository),
        super();

  @override
  void onInitState() {
    super.onInitState();
    presenter.geetGreeting('Hola desde el inicio');
  }

  @override
  void initListeners() {
    presenter.getWeatherOnComplete =() {};
    presenter.getWeatherOnError = (e) {};
    presenter.getWeatherOnNext = (Weather weather) {
      this.weather = weather;
      refreshUI();
    };
  }

  void greetingOnNext(Weather weather) {
    weather = weather;
    refreshUI();
  }

  String returnedMsg(){
    return this.weather?.greeting??'';
  }

}