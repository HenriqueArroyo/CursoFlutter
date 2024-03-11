import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 1"),
        ),
        body:Container(
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                    child: Text("Container 1")
                  ),
                  Container(
                    color: Colors.blue,
                    width: 150,
                    height: 150,
                    child: Text("Container 2")
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 200,
                    height: 200,
                    child: Text("Container 3")
                  )
                ],
              ),
            ],
          )
        )
      )
    );
  }
}