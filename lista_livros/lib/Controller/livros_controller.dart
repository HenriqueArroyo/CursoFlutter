import 'dart:io';

import '../Model/livros_model.dart';

class LivrosController {
  List<Livro> _listLivros = [];
  //get
  List<Livro> get listLivros {
    return _listLivros;
  }
  void addLivro(Livro livro) {
    _listLivros.add(livro);
  }
  
  Future<void> salvarJson() async{
     Directory appDocDir = await getApplicationDocumentsDirectory();
     String path = appDocDir.path;
     File file = File('$path/livros.json');
     String json = jsonEncode(_listLivros);
     await file.writeAsString(json);
  }
}
