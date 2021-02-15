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
            Image(
              width: 100,
              image: nivel != 'null'
                  ? AssetImage('assets/imgs/live_human.png')
                  : AssetImage('assets/imgs/dead_human.png'),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  sexo != null ? sexo : 'Não Encontrado',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  nivel != 'null' ? nivel : 'Não Encontrado',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  vocacao != null ? vocacao : 'Não Encontrado',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [IconButton(icon: Icon(Icons.edit), onPressed: null)],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [IconButton(icon: Icon(Icons.delete), onPressed:(){

              })],
            ),
          ],
        ),
      ),
    );
  }
}
