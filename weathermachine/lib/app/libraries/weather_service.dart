import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WeatherService {
  final String apiKey = 'ea340f9cdbaded0c3c4559287fcc22be';

  Future<List<dynamic>> get7DayForecast(LatLng location) async {
    final double latitude = location.latitude;
    final double longitude = location.longitude;

    final String apiUrl = 'https://api.openweathermap.org/data/2.5/forecast/daily'
        '?lat=$latitude&lon=$longitude&cnt=7&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['daily'];
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
      throw Exception('Failed to load weather forecast');
    }
  }
}