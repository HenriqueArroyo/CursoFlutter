import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoricoPage extends StatefulWidget {
  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  List<String> _historico = [];

  @override
  void initState() {
    super.initState();
    _loadSearchHistory();
  }

  Future<void> _loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _historico = prefs.getStringList('historico') ?? [];
    });
  }

  Future<void> _refreshHistory() async {
    // Atualiza o histórico de pesquisas
    await _loadSearchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
      ),
      body: _historico.isEmpty
          ? Center(child: Text('Nenhuma pesquisa feita ainda.'))
          : ListView.builder(
              itemCount: _historico.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_historico[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshHistory, // Chama o método para atualizar o histórico
        tooltip: 'Atualizar',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
