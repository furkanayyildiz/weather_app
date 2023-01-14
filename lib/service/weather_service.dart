import 'dart:convert';

import "../model/weather_model.dart";
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  final String url =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/istanbul?unitGroup=metric&key=HD7QHMGR258E5ZJNBED9QZ3MP&contentType=json";

  Future<WeatherModel?> fetchWeather() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      print("Request Failed ${response.statusCode}");
      throw Exception("Failed...");
    }
  }
}
