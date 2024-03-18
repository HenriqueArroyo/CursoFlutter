import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutResponsivo(),
    );
  }
}

class LayoutResponsivo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size tamanhoTela = MediaQuery.of(context).size;
    double larguraTela = tamanhoTela.width;

    if (larguraTela < 600) {
      // Layout para tela pequena
      return Scaffold(
        appBar: AppBar(
          title: Text('Tela Pequena'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Tela Pequena',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    } else if (larguraTela < 1200) {
      // Layout para tela média
      return Scaffold(
        appBar: AppBar(
          title: Text('Tela Média'),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Tela Média',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    } else {
      // Layout para tela grande
      return Scaffold(
        appBar: AppBar(
          title: Text('Tela Grande'),
        ),
        body: Center(
          child: Container(
            width: 400,
            height: 400,
            color: Colors.blue,
            child: Center(
              child: Text(
                'Tela Grande',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      );
    }
  }
}
