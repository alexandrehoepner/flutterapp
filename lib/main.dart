import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tibia_client/viewModel/PersonagemModel.dart';
import 'Personagem.dart';

void main() {
  runApp(TibiaClientApp());
}

class TibiaClientApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tibia Client"),
        ),
        body: (FutureBuilder(
          future: buscaPersonagens(),
          builder: (contexto, resposta){
            List<PersonagemModel> personagens = resposta.data;
            return ListView.builder(
              itemCount: personagens.length,
              itemBuilder: (context, index) {
                var name = personagens[index].characters.data.name.toString();
                var sex = personagens[index].characters.data.sex.toString();
                var level = personagens[index].characters.data.level.toString();
                var vocation = personagens[index].characters.data.vocation.toString();

                return Personagem(name , sex, level, vocation);
              },
            );
          },
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Personagens'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_travel), label: 'Mundos')
          ],
        ),
      ),
    );
  }


  buscaPersonagens() async{


    List<PersonagemModel> personagens = new List();

    List<String> nomes = new List();
    nomes.add("Spaik");
    nomes.add("Riivv");
    nomes.add("Zeveheinz");
    nomes.add("Zuali");
    nomes.add("Lord+Jaman");
    nomes.add("Mighty+troll");
    nomes.add("Captain+Seasick");
    nomes.add("Trollefar");
    nomes.add("Effektt");
    nomes.add("Damiano+Haze");

    for(int i = 0; i<nomes.length;i++){
      var url = 'https://api.tibiadata.com/v2/characters/'+nomes[i]+".json";
      var resposta = await http.get(url);

      if(resposta.statusCode == 200){
        PersonagemModel model = PersonagemModel.fromJson(jsonDecode(resposta.body));
        personagens.add(model);
      }

    }
    return personagens;
  }

}
