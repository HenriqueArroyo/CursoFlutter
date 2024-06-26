import 'package:flutter/foundation.dart';

class Produto {
  final String nome;
  final double preco;
  final String categoria;
  final String foto;

  const Produto({required this.nome, required this.preco, required this.categoria, required this.foto});

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'preco': preco,
      'categoria': categoria,
      'foto': foto,
    };
  }

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
      foto: json['foto'],
    );
  }
}
