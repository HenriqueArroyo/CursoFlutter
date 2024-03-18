import 'package:flutter/material.dart';
void main() {
runApp(MyApp());
}
class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
home: TabLayout(),
);
}
}
class TabLayout extends StatelessWidget {
@override
Widget build(BuildContext context) {
return DefaultTabController(
length: 3, // Número de abas
child: Scaffold(
appBar: AppBar(
title: Text('Layout com Abas'),

bottom: TabBar(
tabs: [
Tab(text: 'Campo de Futebol'),
Tab(text: 'Quadra de Basquete'),
Tab(text: 'Quadra de Vôlei'),
],
),
),
body: TabBarView(
   children: [
            // Conteúdo da Aba 1
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'campoFutebol.jpg',
                          height: 400,
                          width: 600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
// Conteúdo da Aba 2
Center(
  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'quadraBasquete.png',
                          height: 400,
                          width: 600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
),
// Conteúdo da Aba 3
Center(
  child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'quadraVolei.webp',
                          height: 400,
                          width: 600,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
),
],
),
),
);
}
}