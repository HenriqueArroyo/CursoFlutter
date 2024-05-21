import 'package:flutter/material.dart';
import 'package:projeto_api_geo/view/details_weather_screen.dart';
import 'package:projeto_api_geo/view/favorites_screen.dart';
import 'package:projeto_api_geo/view/search_screen.dart';



import 'View/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto API GEO",
      home: HomeScreen(),
      routes:{
        '/home': (context) => HomeScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/search': (context) => SearchScreen(),
        '/detais': (context) => WeatherDetailsScreen()
        
      }
    );
  }
}