import 'package:projeto_api_geo/Service/city_database_service.dart';
import '../Model/city_model.dart';

class CityDbController {
  //atributos
  List<City> _cities = [];
  final CityDbService _service = CityDbService();
  
  //get cities
  List<City> cities() => _cities;

  //métodos
  //list from db
  Future<List<City>> listCities() async {
    List<Map<String, dynamic>> maps = await _service.listCity();
    _cities = maps.map<City>((e) => City.fromMap(e)).toList();
    return _cities;
  }
  
  //add city
  Future<void> addCity(City city) async {
    await _service.insertCity(city);
  }
  
  //update city
  Future<void> updateCity(City city) async {
    await _service.updateCity(city);
  }
  
  //favoritar cidade
  Future<void> favoriteCity(City city) async {
    city = City(cityName: city.cityName, favoritesCities: true);
    await updateCity(city);
  }
  
  //desfavoritar cidade
  Future<void> unfavoriteCity(City city) async {
    city = City(cityName: city.cityName, favoritesCities: false);
    await updateCity(city);
  }

  //listar cidades favoritas
  Future<List<City>> listFavoriteCities() async {
    await listCities();
    return _cities.where((city) => city.favoritesCities).toList();
  }
}
