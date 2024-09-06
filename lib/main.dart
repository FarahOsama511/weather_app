import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/providers/weatherprovider.dart';
import 'package:weather_app/ui/views/home_view.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(ChangeNotifierProvider(
      create: (context) {
        return Weatherprovider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  Weathermodel? weathermodel;
  WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Provider.of<Weatherprovider>(context).weatherData ==
                  null
              ? Colors.blue
              : Provider.of<Weatherprovider>(context).weatherData!.gettheme()),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
