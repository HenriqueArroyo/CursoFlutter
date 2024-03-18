import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo Responsivo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: layoutResponsivo(),
    );
  }
}

class layoutResponsivo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Obtém as informações sobre o tamanho da tela
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicativo Responsivo'),
      ),
      body: Center(
        child: Container(
          width: screenSize.width * 0.8, // Utiliza 80% da largura da tela
          height: screenSize.height * 0.6, // Utiliza 60% da altura da tela
          color: Colors.blue,
          child: Center(
            child: Text(
              'Conteúdo Responsivo',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
