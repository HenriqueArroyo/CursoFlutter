import 'package:flutter/material.dart';

void main() {
  runApp(MyApp3());
}

class MyApp3 extends StatelessWidget {
   final List<Map<String, String>> data = [
    {'title': 'Eduardo', 'description': '22 anos'},
    {'title': 'Ricardo', 'description': '34 anos'},
    {'title': 'Laura', 'description': '19 anos'},
    {'title': 'Valessa', 'description': '31 anos'},
    {'title': 'Paula', 'description': '27 anos'},
    {'title': 'Jonas', 'description': '38 anos'},
    {'title': 'Heloisa', 'description': '21 anos'},
    {'title': 'Manuel', 'description': '35 anos'},
    {'title': 'Henrique', 'description': '18 anos'},
    {'title': 'Lucas', 'description': '29 anos'},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 3',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView com Cards'),
        ),
        body:  ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: Text(data[index]['title']!),
            subtitle: Text(data[index]['description']!),
          ),
        );
      },
    )
      ),
    );
  }
}

