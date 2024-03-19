import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio 10',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: progresso(),
    );
  }
}

class progresso extends StatefulWidget {
  @override
  _progressoState createState() => _progressoState();
}

class _progressoState extends State<progresso> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    // Simulação de progresso de tarefa
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_progressValue < 1.0) {
        setState(() {
          _progressValue += 0.01;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 10'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            Text('${(_progressValue * 100).toStringAsFixed(2)}% concluído'),
          ],
        ),
      ),
    );
  }
}
