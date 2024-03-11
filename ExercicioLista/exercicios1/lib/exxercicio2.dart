import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("Exercicio2"),),
      body:Container(
        child: Row(children: [
          Column(),
          Column(),
          Column()
        ],),
      ))
    );
  }
}