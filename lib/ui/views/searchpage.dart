import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/providers/weatherprovider.dart';
import 'package:weather_app/services/weather_service.dart';

class Searchpage extends StatelessWidget {
  String? cityName;
  Searchpage({required this.updateui});
  VoidCallback? updateui;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search a City",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeathetService service = WeathetService();
              Weathermodel weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<Weatherprovider>(context, listen: false).weatherData =
                  weather;
              Provider.of<Weatherprovider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 33),
                hintText: "Enter City Name",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
                label: Text("search")),
          ),
        ),
      ),
    );
  }
}
