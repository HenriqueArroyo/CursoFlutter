import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> _itens = List.generate(10, (index) => 'Item ${index + 1}');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 2',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercício 2'),
        ),
        body: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                title: Text(_itens[index]),
                leading: Icon(Icons.star),
                trailing: Icon(Icons.arrow_forward),
              ),
            );
          },
        ),
      ),
    );
  }
}
