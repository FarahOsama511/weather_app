import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weatherprovider.dart';
import 'package:weather_app/ui/views/searchpage.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void updateui() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<Weatherprovider>(context).weatherData;

    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              weatherData == null ? Colors.blue : weatherData.gettheme(),
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Searchpage(
                      updateui: updateui,
                    );
                  }));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ))
          ],
        ),
        body: weatherData == null
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'there is no weather 😔 start',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'searching now 🔍',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                ),
              )
            : Container(
                color: Colors.orange,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                    Text(
                      Provider.of<Weatherprovider>(context).cityName!,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " updated:${weatherData.date}",
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData.getImage()),
                        Text(
                          weatherData.temp.toInt().toString(),
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text('max temp : ${weatherData.maxtemp.toInt()}'),
                            Text("min temp :${weatherData.mintemp.toInt()}"),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherData.WeatherStateName ?? "",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ));
  }
}
