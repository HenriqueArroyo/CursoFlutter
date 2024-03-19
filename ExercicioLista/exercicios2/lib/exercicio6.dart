import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: telaInicial(),
      routes: {
        '/configuracoes': (context) => Configuracoes(),
        '/sobre': (context) => Sobre(),
      },
    );
  }
}

class telaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 6'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Página Inicial'),
             
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.pushNamed(context, '/configuracoes');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Sobre'),
              onTap: () {
                Navigator.pop(context); // Fecha o Drawer
                Navigator.pushNamed(context, '/sobre');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Bem-vindo, vá para o Drawer ali no canto superior esquerdo',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


class Configuracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Center(
        child: Image.asset('assets/kanye.jpg', height: 500, width: 500,)
      ),
    );
  }
}

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Center(
        child: Text(
          'Sistema Operacional: Windows 15.0 mobile 2027 100% atualizado',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
