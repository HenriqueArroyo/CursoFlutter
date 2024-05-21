import 'package:projeto_api_geo/service/weather_service';

import '../Model/weather_model.dart';

class WeatherController {
  final List<Weather> _weatherList = [];
  //get
  List<Weather> get weatherList => _weatherList;

  final WeatherService _service = WeatherService();
  //métodos
  Future<void> getWeather(String city) async{
    try {
       Weather weather = Weather.fromJson(await _service.getWeather(city));
       _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }
  Future<void> getWeatherbyLocation(double lat, double lon) async{
    try {
       Weather weather = Weather.fromJson(
        await _service.getWeatherbyLocation(lat, lon)
        );
       _weatherList.add(weather);
    } catch (e) {
      print(e);
    }
  }
}