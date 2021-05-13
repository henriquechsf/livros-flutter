import 'package:aulabancodados/db/banco_dados.dart';
import 'package:aulabancodados/db/livro.dart';
import 'package:sqflite/sqflite.dart';

class LivroHelper {
  
  Future<Livro> inserir(Livro livro) async {
    Database db = await BancoDados().db;
    livro.codigo = await db.insert(Livro.nomeTabela, livro.toMap());
    return livro;
  }

  Future<int> alterar(Livro livro) async {
    Database db = await BancoDados().db;
    return await db.update(Livro.nomeTabela, livro.toMap(),
        where: "codigo = ?", whereArgs: [livro.codigo]);
  }

  Future<int> apagar(int codigo) async {
    Database db = await BancoDados().db;
    return await db.delete(Livro.nomeTabela,
        where: "codigo = ?", whereArgs: [codigo]);
  }

  Future<List> getTodos(int codigo) async {
    Database db = await BancoDados().db;

    // List listMap = await db.query(Livro.nomeTabela);
    List listaMap = await db.rawQuery("SELECT * FROM ${Livro.nomeTabela}");
    List<Livro> listaLivro = [];

    for(Map m in listaMap) {
      listaLivro.add(Livro.fromMap(m));
    }

    return listaLivro;
  }

  Future<Livro> getLivro(int codigo) async {
    Database db = await BancoDados().db;
    List listMap = await db.query(Livro.nomeTabela,
        where: "codigo = ?", whereArgs: [codigo]);

    if (listMap.length > 0)
      return Livro.fromMap(listMap.first);
    else
      return null;
  }
}