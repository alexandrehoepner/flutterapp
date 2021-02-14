import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tibia_client/PersonagemItem.dart';
import 'package:tibia_client/database_helper.dart';
import 'package:tibia_client/model/Personagem.dart';

import 'Personagem_Detalhes.dart';
import 'viewModel/PersonagemModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper db = DatabaseHelper();
  List<Personagem> personagens;
  List<PersonagemModel> personagensBuscados;

  @override
  void initState() {
      updateView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tibia Client"),
      ),
      body: ListView.builder(
        itemCount: personagensBuscados?.length ?? 0,
        itemBuilder: (context, index) {
          return PersonagemItem(personagensBuscados[index].characters.data.name, personagensBuscados[index].characters.data.sex, personagensBuscados[index].characters.data.level.toString(), personagensBuscados[index].characters.data.vocation);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Adicionar Personagem Buscar Dados',
        onPressed: () async {
          bool resp = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => PersonagemDetalhes()));

          if (resp == true) {
            updateView();
          }
        },
      ),
    );
  }

  void updateView() {
    db.listar().then((personagensFromDatabase) {
        this.personagens = personagensFromDatabase;
        buscaPersonagens().then((personagensBuscados){
          setState(() {
            this.personagensBuscados = personagensBuscados;
          });
      });
    });
  }

 Future<List<PersonagemModel>> buscaPersonagens() async {

    if(personagensBuscados != null){
      this.personagensBuscados.clear();
    }


    List<String> nomes = new List();

    for(int i = 0; i<personagens.length;i++) {
     nomes.add(personagens[i].nome.replaceAll(RegExp(' +'), '+'));
    }

    List<PersonagemModel> modelos = new List();

    for(int i = 0; i<nomes.length;i++){
      var url = 'https://api.tibiadata.com/v2/characters/'+nomes[i]+".json";
      var resposta = await http.get(url);

      var jsonObject = jsonDecode(resposta.body);

      if(resposta.statusCode == 200 && jsonObject['characters']['error'] == null ){
        PersonagemModel model = PersonagemModel.fromJson(jsonDecode(resposta.body));
        modelos.add(model);
      }
    }

    for(int i = 0; i<modelos.length;i++){
      print(modelos[i].characters.data.name);
    }
    return modelos;
  }

}
