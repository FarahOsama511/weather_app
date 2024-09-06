import 'package:flutter/material.dart';

class Weathermodel {
  final String date;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String WeatherStateName;

  Weathermodel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.WeatherStateName});

  factory Weathermodel.fromjson(dynamic data) {
    var jsondata = data["forecast"]["forecastday"][0]["day"];

    return Weathermodel(
        date: data["location"]["localtime"],
        temp: jsondata["avgtemp_c"],
        maxtemp: jsondata["maxtemp_c"],
        mintemp: jsondata["mintemp_c"],
        WeatherStateName: jsondata["condition"]["text"]);
  }
  String getImage() {
    if (WeatherStateName == "Clear" || WeatherStateName == "Light Cloud") {
      return "assets/images/clear.png";
    } else if (WeatherStateName == "Sleet" || WeatherStateName == "Hail") {
      return "assets/images/snow.png";
    } else if (WeatherStateName == "Heavy Cloud") {
      return "assets/images/cloudy.png";
    } else if (WeatherStateName == "Light Rain" ||
        WeatherStateName == "Heavy rain" ||
        WeatherStateName == "Showers") {
      return "assets/images/rainy.png";
    } else if (WeatherStateName == "Thunderstorm" ||
        WeatherStateName == "Thunder") {
      return "assets\images\thunderstorm.png";
    } else {
      return "assets/images/clear.png";
    }
  }

  MaterialColor gettheme() {
    if (WeatherStateName == "Clear" || WeatherStateName == "Light Cloud") {
      return Colors.orange;
    } else if (WeatherStateName == "Sleet" || WeatherStateName == "Hail") {
      return Colors.blue;
    } else if (WeatherStateName == "Heavy Cloud") {
      return Colors.blueGrey;
    } else if (WeatherStateName == "Light Rain" ||
        WeatherStateName == "Heavy rain" ||
        WeatherStateName == "Showers") {
      return Colors.blue;
    } else if (WeatherStateName == "Thunderstorm" ||
        WeatherStateName == "Thunder") {
      return Colors.yellow;
    } else {
      return Colors.orange;
    }
  }
}
