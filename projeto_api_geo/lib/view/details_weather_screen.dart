import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';
import 'package:projeto_api_geo/Controller/city_controller.dart';
import 'package:projeto_api_geo/Model/city_model.dart';

class WeatherDetailsScreen extends StatefulWidget {
  final String cityName;
  const WeatherDetailsScreen({super.key, required this.cityName});

  @override
  State<WeatherDetailsScreen> createState() => _WeatherDetailsScreenState();
}

class _WeatherDetailsScreenState extends State<WeatherDetailsScreen> {
  final WeatherController _weatherController = WeatherController();
  final CityDbController _cityDbController = CityDbController();
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _weatherController.getWeather(widget.cityName);
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    List<City> cities = await _cityDbController.listCities();
    City? city = cities.firstWhere((c) => c.cityName == widget.cityName, orElse: () => City(cityName: widget.cityName, favoritesCities: false));
    setState(() {
      _isFavorite = city.favoritesCities;
    });
  }

  Future<void> _toggleFavorite() async {
    City city = City(cityName: widget.cityName, favoritesCities: !_isFavorite);
    if (_isFavorite) {
      await _cityDbController.unfavoriteCity(city);
    } else {
      await _cityDbController.favoriteCity(city);
    }
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
        actions: [
          IconButton(
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: _toggleFavorite,
          ),
        ],
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
              future: _weatherController.getWeather(widget.cityName),
              builder: (context, snapshot) {
                if (_weatherController.weatherList.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  double tempInCelsius = _weatherController.weatherList.last.temp - 273;
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
                      Text(_weatherController.weatherList.last.name),
                      Text(_weatherController.weatherList.last.description),
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
