import 'package:dio/dio.dart';
import 'package:weather_app/models/weathermodel.dart';
import 'package:weather_app/services/endpoints.dart';

class WeathetService {
  final String baseurl = "http://api.weatherapi.com/v1/";
  final String apikey = "63f0ea915a6e40cebf550952240109";
  final Dio _dio = Dio();
  Future<Weathermodel> getWeather({required String cityName}) async {
    Response response = await _dio.get(
      '$baseurl${Endpoints.forecast}.json?key=$apikey&q=$cityName&aqi=no',
    );
    var data = response.data;

    Weathermodel weather = Weathermodel.fromjson(data);
    return weather;
  }
}
