import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio 7',
      home: StackExample(),
    );
  }
}

class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 7'),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset('assets/wallpaperMonark.jpg', height: 1000, width: 1500,),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Container(
              width: 200,
              height: 200,
              child: Center(
                child: Image.asset('assets/kanye.jpg')
              ),
            ),
          ),
        ],
      ),
    );
  }
}
