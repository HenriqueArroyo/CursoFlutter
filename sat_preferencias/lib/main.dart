import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'settings_page.dart'; // Importando a página de configurações

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
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isRegistering = false;

  Database? _database;
  bool _databaseInitialized = false;

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE users(id SERIAL PRIMARY KEY, email TEXT, password TEXT)",
        );
      },
      version: 1,
    );
    setState(() {
      _databaseInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_databaseInitialized) {
      // Exibir uma tela de carregamento enquanto o banco de dados está sendo inicializado
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
                _isRegistering ? _register(context) : _login(context);
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

  void _register(BuildContext context) async {
    if (!_databaseInitialized) {
      // Evitar que o usuário realize operações enquanto o banco de dados está sendo inicializado
      return;
    }
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();

    // Verifica se o email segue o padrão 'user@example.com'
    if (!_isValidEmail(email)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('O e-mail não segue o padrão correto (user@example.com).'),
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
      return;
    }

    if (password == confirmPassword) {
      final newUser = await _database!.insert(
        'users',
        {'email': email, 'password': password},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print('Novo usuário registrado com id: $newUser');
      Navigator.pop(context);
    } else {
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

  void _login(BuildContext context) async {
    if (!_databaseInitialized) {
      // Evitar que o usuário realize operações enquanto o banco de dados está sendo inicializado
      return;
    }
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    final List<Map<String, dynamic>> users = await _database!.query(
      'users',
      where: "email = ? AND password = ?",
      whereArgs: [email, password],
    );

    if (users.isNotEmpty) {
      print('Login realizado com sucesso!');
      print('Email: $email');
      print('Senha: $password');
      Navigator.push( // Realizando o redirecionamento para a página de configurações
        context,
        MaterialPageRoute(builder: (context) => SettingsPage(userEmail: '',)),
      );
    } else {
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

  bool _isValidEmail(String email) {
    // Verifica se o email segue o padrão 'user@example.com'
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  void _toggleRegistering() {
    setState(() {
      _isRegistering = !_isRegistering;
    });
  }
}
