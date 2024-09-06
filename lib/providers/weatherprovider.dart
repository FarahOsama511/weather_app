import 'package:flutter/material.dart';
import 'package:weather_app/models/weathermodel.dart';

class Weatherprovider extends ChangeNotifier {
  Weathermodel? _weatherData;
  String? cityName;
  set weatherData(Weathermodel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  Weathermodel? get weatherData => _weatherData;
}
