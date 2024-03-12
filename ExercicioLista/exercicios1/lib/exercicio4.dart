import 'package:flutter/material.dart';

void main() {
  runApp(MyApp4());
}

class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 4"),
          centerTitle: true,
          leading: Icon(Icons.arrow_back_ios),
          backgroundColor: Colors.amber,
          actions: [Icon(Icons.shop)],
          elevation: 8,
        ),
      )
    );
  }
}
