import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light, // Define o tema claro como padrão
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, // Define o tema escuro
      ),
      home: FutureBuilder<String>(
        future: _getUserEmail(), // Obtém o e-mail do usuário
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar o e-mail do usuário.'),
              );
            }
            if (snapshot.hasData) {
              return SettingsPage(userEmail: snapshot.data!); // Passa o e-mail do usuário para a página de configurações
            }
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Future<String> _getUserEmail() async {
    // Simula a obtenção do e-mail do usuário (pode ser substituído pela lógica real)
    // Aqui, estamos retornando um e-mail de exemplo
    return 'user@example.com';
  }
}

class SettingsPage extends StatefulWidget {
  final String userEmail; // Adiciona uma propriedade para armazenar o e-mail do usuário

  SettingsPage({required this.userEmail}); // Construtor que recebe o e-mail do usuário

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SharedPreferences _prefs;
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      // Carrega a preferência de tema com base no e-mail do usuário
      _darkMode = _prefs.getBool(widget.userEmail) ?? false;
    });
  }

  Future<void> _toggleDarkMode() async {
    setState(() {
      _darkMode = !_darkMode;
    });
    await _prefs.setBool(widget.userEmail, _darkMode); // Salva a preferência de tema associada ao e-mail do usuário
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      data: _darkMode ? ThemeData.dark() : ThemeData.light(), // Define o tema com base no modo escuro
      duration: Duration(milliseconds: 500), // Define a duração da transição
      child: Scaffold(
        appBar: AppBar(
          title: Text('Página de Configurações'),
        ),
        body: Center(
          child: Switch(
            value: _darkMode,
            onChanged: (value) {
              _toggleDarkMode();
            },
          ),
        ),
      ),
    );
  }
}
