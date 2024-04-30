import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livraria Senai'),
      ),
      body: Padding(padding: EdgeInsets.all(12), child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onPressed, 
               
              child: Text("Listar Livros"),
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: onPressed, 
              child: Text"Cadastrar Livro"),
          ],
        ),
      ),),
    );
  }
}