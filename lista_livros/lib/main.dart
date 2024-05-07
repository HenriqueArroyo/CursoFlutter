import 'package:flutter/material.dart';
import 'package:lista_livros/view/cadastrar_livros_view.dart';
import 'package:lista_livros/view/home_screen_view.dart';
import 'package:lista_livros/view/lista_livro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livraria Senai',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/cadastrar': (context) => const CadastrarLivroScreen(),
        '/listar': (context) => const ListarLivrosScreen()
      },
    );
  }
}
