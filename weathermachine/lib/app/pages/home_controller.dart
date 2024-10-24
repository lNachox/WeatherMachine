
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:weathermachine/app/pages/home_presenter.dart';
import 'package:weathermachine/data/remote/data_weather_repository.dart';
import 'package:weathermachine/domain/entities/hourly_weather.dart';
import 'package:weathermachine/domain/entities/weather.dart';

class HomeController extends Controller {
  final HomePresenter presenter;
  Weather? weather;
  HourlyWeather? hourlyWeather;

  HomeController(
      DataWeatherRepository dataHomeRepository
      ): presenter = HomePresenter(dataHomeRepository),
        super();

  @override
  void onInitState() {
    super.onInitState();
    presenter.getWeather();
    presenter.getHourlyForecast();
  }

  @override
  void initListeners() {
    presenter.getWeatherOnComplete =() {};
    presenter.getWeatherOnError = (e) {};
    presenter.getWeatherOnNext = (Weather weather) {
      this.weather = weather;
      refreshUI();
    };

    presenter.getHourlyForecastOnComplete =() {};
    presenter.getHourlyForecastOnError = (e) {};
    presenter.getHourlyForecastOnNext = (HourlyWeather hourlyWeather) {
      this.hourlyWeather = hourlyWeather;
      refreshUI();
    };
  }

  void weatherOnNext(Weather weather) {
    weather = weather;
    refreshUI();
  }

  void hourlyWeatherOnNext(HourlyWeather hourlyWeather) {
    hourlyWeather = hourlyWeather;
    refreshUI();
  }

  String testWeather(){
    String test = weather?.sys.country??'error test';
    String test2 = weather?.name??'error test';
    return test + test2;
  }

}