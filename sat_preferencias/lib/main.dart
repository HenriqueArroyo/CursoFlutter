import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro e Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationLoginPage(),
    );
  }
}

class RegistrationLoginPage extends StatefulWidget {
  @override
  _RegistrationLoginPageState createState() => _RegistrationLoginPageState();
}

class _RegistrationLoginPageState extends State<RegistrationLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isRegistering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isRegistering ? 'Cadastro' : 'Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
            ),
            if (_isRegistering) ...[
              SizedBox(height: 20),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirmar Senha',
                ),
                obscureText: true,
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_isRegistering) {
                  _register(context);
                } else {
                  _login(context);
                }
              },
              child: Text(_isRegistering ? 'Cadastrar' : 'Login'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                _toggleRegistering();
              },
              child: Text(
                _isRegistering
                    ? 'Já tem uma conta? Faça login'
                    : 'Não tem uma conta? Cadastre-se',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _register(BuildContext context) {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    if (password == confirmPassword) {
      // Em um aplicativo real, você enviaria esses dados para um serviço de autenticação
      // Aqui, vamos apenas imprimir para demonstração
      print('Cadastro realizado com sucesso!');
      print('Email: $email');
      print('Senha: $password');
      Navigator.pop(context);
    } else {
      // Senhas não coincidem
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('As senhas não coincidem.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _login(BuildContext context) {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    // Em um aplicativo real, você enviaria esses dados para um serviço de autenticação
    // Aqui, vamos apenas verificar valores estáticos para demonstração
    if (email == 'user@example.com' && password == 'password') {
      print('Login realizado com sucesso!');
      print('Email: $email');
      print('Senha: $password');
      // Redirecionar para a tela principal ou outra tela desejada
    } else {
      // Credenciais inválidas
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Credenciais inválidas.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _toggleRegistering() {
    setState(() {
      _isRegistering = !_isRegistering;
    });
  }
}
