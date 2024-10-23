import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:weathermachine/app/pages/home_controller.dart';
import 'package:weathermachine/app/utils/constants.dart';
import 'package:weathermachine/app/utils/strings.dart';
import 'package:weathermachine/app/utils/text_styles.dart';
import 'package:weathermachine/app/widgets/gradient_container.dart';
import 'package:weathermachine/app/widgets/weather_info.dart';
import 'package:weathermachine/data/remote/data_weather_repository.dart';

class HomeView extends CleanView {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ResponsiveViewState<HomeView, HomeController> {
  _HomeViewState() : super(HomeController(DataWeatherRepository()));

  @override
  // TODO: implement desktopView
  Widget get desktopView => Scaffold(
        key: globalKey,
        body: Center(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return GradientContainer(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      // Country name text
                      Text(
                        controller.weather?.name ?? "Temuco",
                        style: TextStyles.h1,
                      ),

                      const SizedBox(height: 20),

                      // Today's date
                      Text(
                        DateTime.now().toIso8601String(),
                        style: TextStyles.subtitleText,
                      ),

                      const SizedBox(height: 30),

                      // Weather icon big
                      SizedBox(
                        height: 260,
                        child: Image.asset(
                          'assets/icons/${controller.weather?.weather[0].icon.replaceAll('n', 'd')}.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Weather description
                      Text(
                        controller.weather?.weather[0].description.capitalize ??
                            "",
                        style: TextStyles.h2,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Weather info in a row
                  WeatherInfo(weather: controller.weather),

                  const SizedBox(height: 40),

                  // Today Daily Forecast
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'View full report',
                          style: TextStyle(
                            color: AppColors.accentBlue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // hourly forcast
                  //const HourlyForecastView(),
                ],
              );
            },
          ),
        ),
      );

  @override
  // TODO: implement mobileView
  Widget get mobileView => Scaffold(
        key: globalKey,
        body: Center(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return GradientContainer(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      // Country name text
                      Text(
                        controller.weather?.name ?? "City",
                        style: TextStyles.h1,
                      ),

                      const SizedBox(height: 20),

                      // Today's date
                      Text(
                        DateTime.now().toIso8601String(),
                        style: TextStyles.subtitleText,
                      ),

                      const SizedBox(height: 30),

                      // Weather icon big
                      SizedBox(
                        height: 260,
                        child: Image.asset(
                          'assets/icons/${controller.weather?.weather[0].icon.replaceAll('n', 'd')}.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Weather description
                      Text(
                        controller.weather?.weather[0].description.capitalize ??
                            "",
                        style: TextStyles.h2,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Weather info in a row
                  WeatherInfo(weather: controller.weather),

                  const SizedBox(height: 40),

                  // Today Daily Forecast
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'View full report',
                          style: TextStyle(
                            color: AppColors.accentBlue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // hourly forcast
                  //const HourlyForecastView(),
                ],
              );
            },
          ),
        ),
      );

  @override
  // TODO: implement tabletView
  Widget get tabletView => Scaffold(
        key: globalKey,
        body: Center(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return GradientContainer(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      // Country name text
                      Text(
                        controller.weather?.name ?? "Temuco",
                        style: TextStyles.h1,
                      ),

                      const SizedBox(height: 20),

                      // Today's date
                      Text(
                        DateTime.now().toIso8601String(),
                        style: TextStyles.subtitleText,
                      ),

                      const SizedBox(height: 30),

                      // Weather icon big
                      SizedBox(
                        height: 260,
                        child: Image.asset(
                          'assets/icons/${controller.weather?.weather[0].icon.replaceAll('n', 'd')}.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Weather description
                      Text(
                        controller.weather?.weather[0].description.capitalize ??
                            "",
                        style: TextStyles.h2,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Weather info in a row
                  WeatherInfo(weather: controller.weather),

                  const SizedBox(height: 40),

                  // Today Daily Forecast
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'View full report',
                          style: TextStyle(
                            color: AppColors.accentBlue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // hourly forcast
                  //const HourlyForecastView(),
                ],
              );
            },
          ),
        ),
      );

  @override
  // TODO: implement watchView
  Widget get watchView => Scaffold(
        key: globalKey,
        body: Center(
          child: ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return GradientContainer(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                      ),
                      // Country name text
                      Text(
                        controller.weather?.name ?? "Temuco",
                        style: TextStyles.h1,
                      ),

                      const SizedBox(height: 20),

                      // Today's date
                      Text(
                        DateTime.now().toIso8601String(),
                        style: TextStyles.subtitleText,
                      ),

                      const SizedBox(height: 30),

                      // Weather icon big
                      SizedBox(
                        height: 260,
                        child: Image.asset(
                          'assets/icons/${controller.weather?.weather[0].icon.replaceAll('n', 'd')}.png',
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Weather description
                      Text(
                        controller.weather?.weather[0].description.capitalize ??
                            "",
                        style: TextStyles.h2,
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Weather info in a row
                  WeatherInfo(weather: controller.weather),

                  const SizedBox(height: 40),

                  // Today Daily Forecast
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.white,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'View full report',
                          style: TextStyle(
                            color: AppColors.accentBlue,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // hourly forcast
                  //const HourlyForecastView(),
                ],
              );
            },
          ),
        ),
      );
}
