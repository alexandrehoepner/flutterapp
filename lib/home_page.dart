import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
          return Container(
            margin: EdgeInsets.all(5),
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepOrangeAccent,
              child: Row(
                children: [
                  Image(
                    width: 100,
                    image: personagensBuscados[index].characters.data.level != null
                        ? AssetImage('assets/imgs/live_human.png')
                        : AssetImage('assets/imgs/dead_human.png'),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        personagensBuscados[index].characters.data.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        personagensBuscados[index].characters.data.sex != null ? personagensBuscados[index].characters.data.sex : 'Não Encontrado',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        personagensBuscados[index].characters.data.level != null ? personagensBuscados[index].characters.data.level.toString() : 'Não Encontrado',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        personagensBuscados[index].characters.data.vocation != null ? personagensBuscados[index].characters.data.vocation : 'Não Encontrado',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [IconButton(icon: Icon(Icons.edit), onPressed: (){
                      abrirPersonagemDetalhes(personagensBuscados[index].characters.data.name);
                    })],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [IconButton(icon: Icon(Icons.delete), onPressed:(){
                      excluir(personagensBuscados[index].characters.data.name);
                    })],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Adicionar Personagem Buscar Dados',
        onPressed: () async {
          abrirPersonagemDetalhes("");
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
      }else{
        PersonagemModel model = PersonagemModel.fromJson(jsonDecode(resposta.body));
        model.characters.data.name = nomes[i].replaceAll(RegExp(r'[+]'), ' ');
        modelos.add(model);
      }
    }
    return modelos;
  }

  void excluir(String nome){
      db.excluir(nome).then((value) => updateView());
  }

  void abrirPersonagemDetalhes(String name) async{
    bool resp = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PersonagemDetalhes(name)));

    if (resp == true) {
      updateView();
    }

  }


}
