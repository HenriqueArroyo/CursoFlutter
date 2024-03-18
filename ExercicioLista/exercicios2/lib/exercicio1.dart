import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 1',
      home: Scaffold(
        appBar: AppBar(

        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Container',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 50,
                    ),
                    Text(
                      'Flutter',
                      style: TextStyle(fontSize: 30),
                    ),
                    Image.asset(
                      'assets/flutter_logo.png',
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
