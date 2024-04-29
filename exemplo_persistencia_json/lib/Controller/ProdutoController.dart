import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:exemplo_persistencia_json/Model/ProdutosModel.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class ProdutoController {
  final List<Produto> produtos = []; // Lista de produtos

  // Método para carregar produtos do arquivo JSON
  Future<List<Produto>> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    // Converte os objetos JSON em instâncias de Produto e adiciona à lista de produtos
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
    return produtos;
  }
/* 
  // Método para salvar produtos no arquivo JSON
  Future<List<Produto>> saveProdutos() async {
    // Obtém o diretório de documentos do aplicativo
    final appDocDir = await getApplicationDocumentsDirectory();
    // Caminho do arquivo produtos.json no diretório de documentos
    final filePath = '${appDocDir.path}/produtos.json';
    // Converte os produtos em uma lista de JSON
    final jsonList = produtos.map((produto) => produto.toJson()).toList();
    // Escreve a lista de JSON no arquivo produtos.json
    await File(filePath).writeAsString(json.encode(jsonList));
    return produtos;
  }

  // Método para adicionar um novo produto à lista
  void adicionarProduto(Produto produto) {
    produtos.add(produto);
  }

  void deletarProduto(Produto produto) {
    produtos.remove(produto);
  }

// Método para salvar os produtos no arquivo JSON(volta)
  Future<void> salvarProdutosNoArquivo() async {
    try {
      final jsonList = produtos.map((produto) => produto.toJson()).toList();
      await File('assets/produtos.json').writeAsString(json.encode(jsonList));
    } catch (e) {
      print('Erro ao salvar produtos no arquivo: $e');
    }
  } */
}
