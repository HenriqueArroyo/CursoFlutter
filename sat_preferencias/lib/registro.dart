import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Implementar lógica de registro
          },
          child: Text('Registrar'),
        ),
      ),
    );
  }
}
