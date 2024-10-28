import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weathermachine/app/libraries/weather_service.dart';

class DetailedWeatherScreen extends StatelessWidget {
  final LatLng location;
  final WeatherService weatherService = WeatherService();

  DetailedWeatherScreen({required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pronóstico a futuro del Clima'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: weatherService.get7DayForecast(location),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar el pronóstico'));
          } else if (snapshot.hasData) {
            List<dynamic> forecast = snapshot.data!;
            return ListView.builder(
              itemCount: forecast.length,
              itemBuilder: (context, index) {
                final dayForecast = forecast[index];
                final DateTime date = DateTime.fromMillisecondsSinceEpoch(dayForecast['dt'] * 1000);
                final double maxTemp = dayForecast['temp']['max'];
                final double minTemp = dayForecast['temp']['min'];
                final String description = (dayForecast['weather'][0]['description'] as String).capitalize();

                return ListTile(
                  leading: Icon(Icons.wb_sunny),
                  title: Text('Día ${index + 1}: $description'),
                  subtitle: Text('Máxima: ${maxTemp.toStringAsFixed(1)}°C\nMínima: ${minTemp.toStringAsFixed(1)}°C'),
                  trailing: Text('${date.day}/${date.month}/${date.year}'),
                );
              },
            );
          } else {
            return Center(child: Text('No se encontraron datos'));
          }
        },
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + this.substring(1);
  }
}