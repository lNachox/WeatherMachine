import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weathermachine/app/pages/home_view.dart';
import 'app/libraries/detailed_weather_screen.dart';
import 'app/libraries/weather_map_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Machine',
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  PageController _pageController = PageController(initialPage: 1); // Inicia en la página HomeView (índice 1)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
        },
        children: [
          MapSample(),
          HomeView(),
          DetailedWeatherScreen(location: LatLng(-38.7490, -72.6173)),
        ],
      ),
    );
  }
}
/*
Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: HomeView(),
        ),
      ),
    );
  }
*/

/*

}
*/