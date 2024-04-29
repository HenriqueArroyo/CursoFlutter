import 'package:exemplo_persistencia_json/Model/ProdutosModel.dart';
import 'package:flutter/material.dart';


class ProdutoInfoPage extends StatelessWidget {
   Produto produto;
   ProdutoInfoPage({required this.produto});

  

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produto Info"),
      ),
      body: Center(child: Column(
        children: [
          Image.asset(produto.foto),
          Text(produto.nome),
          Text(produto.preco as String),
          Text(produto.categoria),
        ],
      ),),
    );
  }
}