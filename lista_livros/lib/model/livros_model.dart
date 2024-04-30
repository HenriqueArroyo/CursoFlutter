//id,
//titulo,
//autor,
//sinopse,
//categoria,
//capa,
//editora,
//isbr,
//preço

class Livro {
  final int id;
  final String titulo;
  final String autor;
  final String sinopse;
  final List<String> categoria;
  final String capa;
  final String editora;
  final String isbr;
  final double preco;

  Livro(
      {required this.id,
      required this.titulo,
      required this.autor,
      required this.sinopse,
      required this.categoria,
      required this.capa,
      required this.editora,
      required this.isbr,
      required this.preco});

  //métodos
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "titulo": titulo,
      "autor": autor,
      "sinopse": sinopse,
      "categoria": categoria,
      "capa": capa,
      "editora": editora,
    };
  }

  factory Livro.FromJson(Map<String, dynamic> map) {
    return Livro(
      id: map["id"],
      titulo: map["titulo"],
      autor: map["autor"],
      sinopse: map["sinopse"],
      categoria: List<String>.from(map["categoria"]),
      capa: map["capa"],
      editora: map["editora"],
      isbr: map["isbr"],
      preco: map["preco"],
    );
  }

      
}
