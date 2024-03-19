import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exercicio 8',
      home: ImageExample(),
    );
  }
}

class ImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('exercicio 8'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://pbs.twimg.com/media/F1175eTXsAAgTMY.jpg:large',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/tadalafila.jpg',
              width: 200,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
