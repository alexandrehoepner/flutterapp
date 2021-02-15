import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tibia_client/model/Personagem.dart';

class DatabaseHelper {

  String CREATE_TABLE = "CREATE TABLE personagem(id INTEGER PRIMARY KEY autoincrement not null, nome TEXT NOT NULL)";
  String TABLE = "personagem";

  Future<Database> abrirConexao() async {
    return openDatabase(
      join(await getDatabasesPath(), 'banco_personagem.db'),
      onCreate: (db, version) {
        return db.execute(
          CREATE_TABLE,
        );
      },
      version: 1,
    );
  }

  Future gravar(Personagem p) async {
    Database db = await this.abrirConexao();
    return db.insert(this.TABLE, p.toMap());
  }

  Future<Personagem> buscarPorNome(String nome) async {
    Database db = await this.abrirConexao();
    List<Map> result = await db.rawQuery('SELECT * FROM '+TABLE+' WHERE nome=?', [nome]);
    return Personagem.fromMap(result[0]);
  }

  Future<Personagem> excluir(String nome) async {
    Database db = await this.abrirConexao();
    List<Map> result = await db.rawQuery('SELECT * FROM '+TABLE+' WHERE nome=?', [nome]);
    Personagem personagem =  Personagem.fromMap(result[0]);
    db.delete(TABLE, where: 'nome = ?', whereArgs: [personagem.nome]);
    return personagem;
  }

  Future<Personagem>alterar(String nomeAntigo, String novoNome) async {
    Database db = await this.abrirConexao();
    List<Map> result = await db.rawQuery('SELECT * FROM '+TABLE+' WHERE nome=?', [nomeAntigo]);
    Personagem personagem =  Personagem.fromMap(result[0]);
    personagem.nome = novoNome;
    db.update(TABLE,personagem.toMap(), where: 'nome = ?', whereArgs: [nomeAntigo]);
    return personagem;
  }

  Future<List<Personagem>> listar() async {
    Database db = await this.abrirConexao();
    List<Map<String, dynamic>> personagens = await db.query(this.TABLE);
    return List.generate(
        personagens.length, (index) => Personagem.fromMap(personagens[index]));
  }
}
