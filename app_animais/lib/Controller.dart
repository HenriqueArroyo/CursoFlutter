import 'package:app_animais/Model.dart';

class AnimalController {
  // Atributos
  List<Animal> _listAnimal = [];


  List get listarAnomaos => _listAnimal;


  void adicionaAnimal(especie, urlFoto, urlAudio){
    Animal novoAnimal = Animal(especie, urlFoto, urlAudio);
    _listAnimal.add(novoAnimal);
    
  }
}