import 'package:flutter/material.dart';
import 'package:tibia_client/database_helper.dart';
import 'package:tibia_client/model/Personagem.dart';

class PersonagemDetalhes extends StatefulWidget {
  @override
  _PersonagemDetalhesState createState() => _PersonagemDetalhesState();
}

class _PersonagemDetalhesState extends State<PersonagemDetalhes> {

  TextEditingController nomeController = TextEditingController();
  DatabaseHelper db = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
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
            RaisedButton(child: Text('Salvar'), onPressed: () {
              this.gravar();
            })
          ],
        ),
      ),
    );
  }

  void gravar() {
    Personagem p = new Personagem(null, nomeController.text);
    db.gravar(p).then((value){
      Navigator.of(context).pop(true);
    });
  }
}
