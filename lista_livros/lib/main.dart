import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Livraria",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      
    );
  }
}
