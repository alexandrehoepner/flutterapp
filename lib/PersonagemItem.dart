import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonagemItem extends StatelessWidget {

  var nome;
  var sexo;
  var nivel;
  var vocacao;

  PersonagemItem(this.nome, this.sexo, this.nivel, this.vocacao);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10),
        color: Colors.deepOrangeAccent,
        child: Row(
          children: [
            FadeInImage(
              placeholder: NetworkImage(
                  "https://media.tenor.com/images/67d17766117cca8152040f688609472b/tenor.gif"),
              width: 100,
              image: NetworkImage(
                  "https://www.tibiawiki.com.br/images/7/76/Tibia_icon.png"),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nome!=null?nome:'Default Value', style: TextStyle(fontSize: 20),),
                Text(sexo!=null?sexo:'Default Value', style: TextStyle(fontSize: 20),),
                Text(nivel!=null?nivel:'Default Value', style: TextStyle(fontSize: 20),),
                Text(vocacao!=null?vocacao:'Default Value', style: TextStyle(fontSize: 20),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
