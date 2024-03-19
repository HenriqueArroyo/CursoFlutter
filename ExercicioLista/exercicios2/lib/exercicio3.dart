import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barra de Navegação',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: telaInicial(),
    );
  }
}

class telaInicial extends StatefulWidget {
  @override
  _telaInicialStatus createState() => _telaInicialStatus();
}

class _telaInicialStatus extends State<telaInicial> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    pagina1(),
    pagina2(),
    pagina3(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de Navegação'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Página1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Página2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Página3',
          ),
        ],
      ),
    );
  }
}

class pagina1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Seja Bem-vindo!!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class pagina2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Trabalhar em Java = depressao: true;',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class pagina3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Vai São Paulo!!',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
