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
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        body: Container(
          color: const Color.fromARGB(255, 0, 0, 0), // Definindo a cor de fundo dentro do Container
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Culto ao Java!!', style: TextStyle(fontSize: 40, color: Colors.white)),
                  Image.asset('assets/logo.png', height: 80, width: 80,),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/java.jpg', height: 300, width: 400,),
                  Text('VAMOS ORAR PELO JAVA!', style: TextStyle(fontSize: 35, color: Colors.white)),
                  Image.asset('assets/javaTATTO.webp', height: 100, width: 100,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
