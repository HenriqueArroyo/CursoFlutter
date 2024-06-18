import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/city_controller.dart';
import 'package:projeto_api_geo/Model/city_model.dart';
import 'package:projeto_api_geo/view/details_weather_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final CityDbController _cityDbController = CityDbController();
  List<City> _favoriteCities = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteCities();
  }

  Future<void> _loadFavoriteCities() async {
    List<City> cities = await _cityDbController.listFavoriteCities();
    setState(() {
      _favoriteCities = cities;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Cities"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _favoriteCities.isEmpty
            ? const Center(child: Text("Sem cidades favoritas."))
            : ListView.builder(
                itemCount: _favoriteCities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_favoriteCities[index].cityName),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeatherDetailsScreen(cityName: _favoriteCities[index].cityName),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
