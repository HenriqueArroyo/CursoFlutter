import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  mudaCor createState() => mudaCor();
}

class mudaCor extends State<MyApp> {
  Color _currentColor = Colors.blue;

  void _changeColor() {
    setState(() {
      _currentColor = _currentColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercício 10'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              _changeColor();
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 200,
              height: 200,
              color: _currentColor,
              child: Center(
                child: Text(
                  'Clique aqui!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
