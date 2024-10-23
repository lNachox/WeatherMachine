import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:weathermachine/domain/entities/weather.dart';
import 'package:weathermachine/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;

class DataWeatherRepository implements WeatherRepository {

  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl = 
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';
      
  static const String apiKey = "7d38990fd089639d5e2461591a800058";

  static String _constructWeatherUrl(double lat, double lon) =>
      '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${apiKey}';

  static String _constructForecastUrl(double lat, double lon) =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${apiKey}';

  static String _constructWeatherByCityUrl(String cityName) =>
      '$baseUrl/weather?q=$cityName&units=metric&appid=${apiKey}';

  static String _constructWeeklyForecastUrl(double lat, double lon) =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';


  @override
  Future<Position> getCurrentLocation() async {
    // bool serviceEnabled;
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<Weather> getWeather(double lat, double lon) async {
    final url = _constructWeatherUrl(lat, lon);
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  //* Fetch Data for a url
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data');
    }
  }
}
