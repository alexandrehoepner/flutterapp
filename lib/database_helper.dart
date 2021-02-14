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

  Future<List<Personagem>> listar() async {
    Database db = await this.abrirConexao();
    List<Map<String, dynamic>> personagens = await db.query(this.TABLE);
    return List.generate(
        personagens.length, (index) => Personagem.fromMap(personagens[index]));
  }
}
