import 'dart:convert';

import 'package:flutter/cupertino.dart';

import "../model/weather_model.dart";
import 'package:http/http.dart' as http;

class WeatherService {
  final String baseUrl =
      "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/";

  Future<WeatherModel?> fetchWeather(String cityName) async {
    var response = await http.get(Uri.parse(
        '$baseUrl$cityName?unitGroup=metric&key=HD7QHMGR258E5ZJNBED9QZ3MP&contentType=json'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      print("Request Failed ${response.statusCode}");
      throw Exception("Failed...");
    }
  }
}
