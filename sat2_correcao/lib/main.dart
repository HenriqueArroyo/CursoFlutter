import 'package:flutter/material.dart';
import 'View/LoginPageView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Material App',
             debugShowCheckedModeBanner: false,
             home: PaginaLogin(),
        );
      }
    }
  
