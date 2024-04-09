class contaModel {
  //atributos
  String email;
  String password;
  //construtor
  contaModel({

    required this.email,
    required this.password
  });
  //mapeamento
  Map<String, dynamic> toMap() {
    return {
    
      'email': email,
      'password': password
    };
  }

  factory contaModel.fromMap(Map<String, dynamic> map) {
    return contaModel(
      email: map['email'],
       password: map['password']
    );
  }
}
