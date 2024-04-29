import 'package:flutter/material.dart';
import 'package:exemplo_persistencia_json/View/PaginaInicial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProdutosPage(),
    );
  }
}
