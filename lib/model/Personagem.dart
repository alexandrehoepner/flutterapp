class Personagem {
  int id;
  String nome;

  Personagem(this.id, this.nome);

  Map<String, dynamic> toMap() {
    return {'id': this.id, "nome": this.nome};
  }

  static fromMap(map) {
    return Personagem(map['id'], map['nome']);
  }
}
