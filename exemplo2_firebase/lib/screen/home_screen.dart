import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Ação do botão de login
                // Aqui você pode adicionar a lógica para fazer login
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Ação do botão de registro
                // Aqui você pode adicionar a lógica para registrar um novo usuário
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
