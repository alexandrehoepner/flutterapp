import 'package:flutter/material.dart';
import 'package:tibia_client/database_helper.dart';
import 'package:tibia_client/model/Personagem.dart';

class PersonagemDetalhes extends StatefulWidget {
  String nome;

  PersonagemDetalhes(this.nome);

  @override
  _PersonagemDetalhesState createState() => _PersonagemDetalhesState(nome);
}

class _PersonagemDetalhesState extends State<PersonagemDetalhes> {
  String nome;
  String nomeAntigo;
  TextEditingController nomeController = TextEditingController();
  DatabaseHelper db = DatabaseHelper();

  _PersonagemDetalhesState(this.nome);

  @override
  Widget build(BuildContext context) {
    nomeAntigo = nome;
    nomeController.text = this.nome;

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Personagem Favorito'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  this.gravar();
                })
          ],
        ),
      ),
    );
  }

  void redireciona() {
    Navigator.of(context).pop(true);
  }

  void gravar() {
    if (nomeAntigo.isNotEmpty) {
      db.alterar(nomeAntigo, nomeController.text).then((value) {
        redireciona();
      });
    } else {
      Personagem p = new Personagem(null, nomeController.text);
      db.gravar(p).then((value) {
        redireciona();
      });
    }
  }
}
