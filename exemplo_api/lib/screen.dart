// Importa o pacote de widgets do Flutter, que contém os widgets para construir interfaces de usuário.
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Importa o serviço WeatherService, que é responsável por obter os dados de previsão do tempo da API.
import 'service.dart';

// Classe StatefulWidget que representa o widget de previsão do tempo.
class PesquisaPage extends StatefulWidget {
  // Sobrescreve o método createState para criar e retornar uma instância do estado do widget.
  @override
  _PesquisaPageState createState() => _PesquisaPageState();
}

// Classe que representa o estado do widget de previsão do tempo.
class _PesquisaPageState extends State<PesquisaPage> {
   List<String> _searchHistory = [];
  TextEditingController _cityController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // Instância do serviço WeatherService para obter os dados de previsão do tempo.
  final WeatherService _weatherService = WeatherService(
    apiKey:
        '681126f28e7d6fa3a7cfe0da0671e599', // Chave de API para acesso à API de previsão do tempo.
    baseUrl:
        'https://api.openweathermap.org/data/2.5', // URL base da API de previsão do tempo.
  );

  // Mapa que armazenará os dados de previsão do tempo.
  late Map<String, dynamic> _weatherData;

  // Método chamado quando o estado é inicializado.
  @override
  void initState() {
    super.initState();
    _weatherData = {
      'name' : '',
      'main':{'temp':0},
      'weather':[
        {'description':''}
      ]
    };
 _loadSearchHistory();
  }

   Future<void> _loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _searchHistory = prefs.getStringList('historico') ?? [];
    });
  }

  Future<void> _saveSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('historico', _searchHistory);
  }

  // Método assíncrono para buscar os dados de previsão do tempo para uma cidade específica.
  Future<void> _fetchWeatherData(String city) async {
    try {
      // Obtém os dados de previsão do tempo para a cidade especificada.
      final weatherData = await _weatherService.getWeather(city);
      // Atualiza o estado do widget com os novos dados de previsão do tempo.
      setState(() {
        _weatherData = weatherData;
          _searchHistory.add(city);
        _saveSearchHistory(); // Save search history after adding a new city
      });
    } catch (e) {
      // Em caso de erro ao buscar os dados de previsão do tempo, exibe uma mensagem de erro no console.
      print('Error fetching weather data: $e');
    }
  }

  // Método responsável por construir a interface de usuário do widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast'),
          // Título da barra de aplicativos.
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Form(
                child: Column(
              children: [
                TextFormField(
                    controller: _cityController,
                    decoration:
                        const InputDecoration(labelText: "Insira a Cidade"),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Insira a Cidade';
                      }
                    }),
                ElevatedButton(
                    onPressed: () {
                       _fetchWeatherData(_cityController.text);
                    },
                    child: const Text("Buscar")),
                SizedBox(
                  height: 12,
                ),

                _weatherData == null
                    ? Center(child: Text(""))
                    : Text(
                          'Cidade: ${_weatherData['name']}'), // Exibe o nome da cidade.
                      Text(
                          'Temperatura: ${_weatherData['main']['temp']} °C'), // Exibe a temperatura em graus Celsius.
                      Text(
                          'Descrição: ${_weatherData['weather'][0]['description']}'), // Exibe a descrição do clima.
              ],
            )),
          ),
        ));
  }
  
}