import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String cityName;
  const WeatherDetailsScreen({super.key, required this.cityName});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  final WeatherController _controller = WeatherController();

  @override
  void initState() {
    _controller.getWeather(widget.cityName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Weather Details',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
     FutureBuilder(
  future: _controller.getWeather(widget.cityName),
  builder: (context, snapshot) {
    if (_controller.weatherList.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      double tempInCelsius = _controller.weatherList.last.temp - 273;
      Widget weatherImage;
      if (tempInCelsius < 11) {
        weatherImage = Image.asset('assets/1.webp', height: 500, width: 500,);
      } else if (tempInCelsius < 31) {
        weatherImage = Image.asset('assets/2.jpg', height: 500, width: 500,);
      } else {
        weatherImage = Image.asset('assets/3.jpg', height: 500, width: 500,);
      }

      return Column(
        children: [
          Text(_controller.weatherList.last.name),
          Text(_controller.weatherList.last.description),
          Text(tempInCelsius.toStringAsFixed(2)),
          SizedBox(height: 20),
          weatherImage,
        ],
      );
    }
  },
)

          ],
        ),
      ),
    );
  }
}