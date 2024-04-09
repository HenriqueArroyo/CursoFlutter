import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Model.dart';

class BancoDadosCrud {
  // Atributos
  static const String DB_NOME = 'formativa.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'contas'; // Nome da tabela
  static const String
      CREATE_CONTAS_TABLE_SCRIPT = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS contas(email TEXT PRIMARY KEY," + " password TEXT)";
  
  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_CONTAS_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar um novo conta no banco de dados
  Future<void> create(contaModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
          TABLE_NOME, model.toMap()); // Insere o conta no banco de dados
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para obter todos os contas do banco de dados
  Future<List<contaModel>> getCONTAS() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps =
          await db.query(TABLE_NOME); // Consulta todos os contas na tabela

      return List.generate(
        maps.length,
        (i) {
          return contaModel.fromMap(maps[
              i]); // Converte os resultados da consulta para objetos ContactModel
        },
      );
    } catch (ex) {
      print(ex);
      return [];
    }
  }

  // Método para atualizar um conta no banco de dados
  Future<void> update(contaModel model) async {
    try {
      final Database db = await _getDatabase();
      await db.update(
        TABLE_NOME,
        model.toMap(),
        where: "email = ?", // Condição para atualizar o conta com base no ID
        whereArgs: [model.email],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }

  // Método para excluir um conta do banco de dados
  Future<void> delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        TABLE_NOME,
        where: "email = ?", // Condição para excluir o conta com base no ID
        whereArgs: [id],
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}