import 'dart:convert';
import 'dart:io';

import 'package:exemplo_persistencia_json/Controller/ProdutoController.dart';
import 'package:flutter/material.dart';
import 'package:exemplo_persistencia_json/Model/ProdutosModel.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProdutoController _produtoController = ProdutoController();
  final TextEditingController _nomeController = TextEditingController(); 
  final TextEditingController _precoController = TextEditingController(); 
  final TextEditingController _categoriaController = TextEditingController(); 
 
  List<Produto> _produtos = [];

  @override
  void initState() {
    super.initState();
    _loadProdutos();
  }

  Future<void> _loadProdutos() async {
    final data = await rootBundle.loadString('assets/produtos.json');
    final jsonList = json.decode(data) as List<dynamic>;
    setState(() {
       _produtos = jsonList.map((e) => Produto(
        nome: e['nome'],
        preco: e['preco'],
        categoria: e['categoria'],
       ) ).toList();
    });
  }
   
   Future<void> _saveProdutos() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDocDir.path}/produtos.json';
    final jsonList = _produtos.map((produto) => produto.toJson()).toList();
    await File(filePath).writeAsString(json.encode(jsonList));
   }

 void _adicionarProduto() {
    final nome = _nomeController.text;
    final preco = double.tryParse(_precoController.text) ?? 0.0;
    final categoria = _categoriaController.text;
    if (nome.isNotEmpty && preco > 0 && categoria.isNotEmpty) {
      setState(() {
        _produtoController.adicionarProduto(Produto(nome: nome, preco: preco, categoria: categoria));
        _produtoController.saveProdutos();
      });
      _nomeController.clear();
      _precoController.clear();
      _categoriaController.clear();
    }
  }
 

 void _deletarProduto(){
    final nome = _nomeController.text;
    final preco = double.tryParse(_precoController.text) ?? 0.0;
    final categoria = _categoriaController.text;

     setState(() {
       _produtoController.deletarProduto(Produto(nome: nome, preco: preco, categoria: categoria));
       _produtoController.saveProdutos();
     });

      _nomeController.clear();
      _precoController.clear();
      _categoriaController.clear();
    }

 


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produtos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome do produto'),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _precoController,
              decoration: InputDecoration(labelText: 'Preço'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _categoriaController,
              decoration: InputDecoration(labelText: 'Categoria'),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: _adicionarProduto,
              child: Text('Adicionar Produto'),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(onPressed: _deletarProduto, child: Text('Remover Produto')),
            Text(
              'Lista de Produtos:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _produtoController.produtos.length,
                itemBuilder: (context, index) {
                  final produto = _produtoController.produtos[index];
                  return ListTile(
                    title: Text(produto.nome),
                    subtitle: Text('Preço: ${produto.preco.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



}