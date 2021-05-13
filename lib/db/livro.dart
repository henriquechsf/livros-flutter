class Livro {
  static const nomeTabela = "tbLivro";
  int codigo;
  String nome, editora;
  int ano;

  static const String scriptCreate =
      "CREATE TABLE $nomeTabela (" +
      " codigo INTEGER PRIMARY KEY," +
      " nome TEXT," +
      " editora TEXT," +
      " ano INTEGER)";

  // construtor vazio
  Livro();

  // serialização
  Livro.fromMap(Map map) {
    codigo = map["codigo"];
    nome = map["nome"];
    editora = map["editora"];
    ano = map["ano"];
  }

  // desserializaçao
  Map toMap() {
    Map<String, dynamic> map = {
      "codigo": codigo,
      "nome": nome,
      "editora": editora,
      "ano": ano
    };
    return map;
  }
}