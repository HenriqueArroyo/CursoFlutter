import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Exercicio2",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 44, 43, 43),
        body: Column(
          children: [
            Image.asset(
              'assets/paulista.png',
              height: 50,
              width: 50,
            ),
            SizedBox(height: 10), // Adiciona espaço entre a imagem e a linha
            Text(
              "Quartas de Final",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(height: 20),
            Container(
              color: const Color.fromARGB(255, 35, 35, 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "São Paulo",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Image.asset(
                        'assets/spfc.png',
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "X",
                        style: TextStyle(fontSize: 60, color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Novorizontino",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      Image.asset(
                        'assets/novorizontino.png',
                        width: 200,
                        height: 200,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 1,
              color: Colors.white, 
              child: Row(
                children: [
                  Text('MorumBis'),
                  Text('17/03'),
                  Text(data)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
